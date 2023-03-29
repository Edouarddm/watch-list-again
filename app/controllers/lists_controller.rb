class ListsController < ApplicationController
  before_action :set_list, only: [:destroy]

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params_list)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_list
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params([:id]))
  end
end
