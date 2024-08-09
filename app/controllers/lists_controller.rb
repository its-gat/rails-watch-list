class ListsController < ApplicationController
  before_action :set_list, only: %i[show destroy]

  def index
    @lists = List.all
  end

  def show
    @movies = @list.movies
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(strong_params)
    if @list.save
      redirect_to root_path, notice: 'List was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def strong_params
    params.require(:list).permit(:name, :banner_image)
  end
end
