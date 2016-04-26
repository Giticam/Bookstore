class PublishersController < ApplicationController
  def new
    @page_title = 'Add New Publisher'
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new publisher_params
    if @publisher.save
      redirect_to publishers_path, notice: "Publisher Added"
    else
      render 'new'
    end
  end


  def update
    @publisher = Publisher.find(params[:id])
    if @publisher.update publisher_params
      redirect_to publishers_path, notice: "Publisher updated"
    else
      render 'edit'
    end
  end

  def edit
    @publisher = Publisher.find(params[:id])
  end

  def destroy
    @publisher = Publisher.find(params[:id])
    @publisher.destroy
    redirect_to publishers_path, notice: "Publisher deleted"
  end

  def index
    @publishers = Publisher.all
  end


  private
  def publisher_params
    params.require(:publisher).permit(:name)
  end
end
