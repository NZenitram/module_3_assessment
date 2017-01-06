class Api::V1::Items::ItemsController < ApplicationController
  def index
    render json: Item.all, serializer: ItemSerializer
  end
end
