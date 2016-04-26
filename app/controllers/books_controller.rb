class BooksController < ApplicationController
  def index
    @books = Book.all
    @categories = Category.all
  end

  def new
    @page_title = 'Add New Book'
    @book = Book.new
    @category = Category.new
    @author = Author.new
    @publisher = Publisher.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      redirect_to books_path, notice: "Book Created"
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])
     if @book.update book_params
       redirect_to books_path, notice: "Book updated"
     else
       render 'edit'
     end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "Book deleted"
  end

  def show
    @book = Book.find(params[:id])
    @categories = Category.all
  end

  private

  def book_params
    params.require(:book).permit(:title,:category_id, :author_id, :publisher_id, :isbn, :price, :format, :excerpt, :pages, :year)
  end
end
