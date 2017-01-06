class SearchController < ApplicationController

   def index
    zip = params[:q]
    conn = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,name,city,hours,distance&pageSize=25&apiKey=7a3heu7emrjz6qbsugmepbv6")
    response = JSON.parse(conn.body, symoblize_names: true)
    @total_number_of_stores = response["total"]
    @list_of_stores = response["stores"]
   end
end
