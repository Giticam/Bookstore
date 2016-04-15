class BooksController < ApplicationController
  def index
  end

  def new
    @page_title = 'Add New Book'
    @book = Book.new
    @category = Category.new
    @author = Author.new
    @publisher = Publisher.new
  end

  def create
    @book = Book.new books_params
    @book.save
    redirect_to books_path
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  private

  def book_params
    params.require(:book).permit(:title,:category_id, :author_id, :publisher_id, :isbn, :price, :format, :excerpt, :pages, :year)
  end
end
