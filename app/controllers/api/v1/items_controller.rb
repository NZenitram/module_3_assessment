class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)

    if item.save
      render json: item
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    render json: Item.all
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end
