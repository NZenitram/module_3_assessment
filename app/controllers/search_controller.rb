class SearchController < ApplicationController

   def index
    zip = params[:q]
    @total_number_of_stores = StoreService.new(zip).get_stores_total
    @list_of_stores = StoreService.new(zip).get_stores
   end
end
