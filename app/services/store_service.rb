class StoreService

  def self.get_stores(zip)
    conn = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,name,city,hours,distance&pageSize=25&apiKey=7a3heu7emrjz6qbsugmepbv6")
    response = JSON.parse(conn.body, symoblize_names: true)
  end

end
