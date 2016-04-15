class AuthorsController < ApplicationController
  def new
    @page_title = 'Add New Author'
    @author = Author.new
  end

  def create
    @author = Author.new author_params
    @author.save
    redirect_to authors_path

  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

  private
  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end
end
