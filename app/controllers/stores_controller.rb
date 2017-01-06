class StoresController < ApplicationController

  def show
    zip = params["zip"]
    @store = StoreService.new(zip).store_info
  end
end
