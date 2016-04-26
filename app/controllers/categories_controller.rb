class CategoriesController < ApplicationController
  def new
    @page_title = 'Add New Category'
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to categories_path, notice: "Category added"
    else
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])
     if @category.update category_params
       redirect_to categories_path, notice: "Category updated"
     else
       render 'edit'
     end
   end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: "Category deleted"
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @books = @category.books
  end
  private
  def category_params
    params.require(:category).permit(:name)
  end
end
