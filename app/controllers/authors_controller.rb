class AuthorsController < ApplicationController
  def new
    @page_title = 'Add New Author'
    @author = Author.new
  end

  def create
    @author = Author.new author_params
    if @author.save
      redirect_to authors_path, notice: "Author Added"
    else
      render 'new'
    end
  end

  def update
    @author = Author.find(params[:id])
    if @author.update author_params
      redirect_to authors_path, notice: "Author updated"
    else
      render 'edit'
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_to authors_path, notice: "Author deleted"

  end

  def index
    @authors = Author.all
  end


  private
  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end
end
