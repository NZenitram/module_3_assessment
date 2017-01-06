class StoreService

  def initialize(zip)
    @zip = zip
  end

  def get_stores
    call(zip)["stores"]
  end

  def get_stores_total
    call(zip)["total"]
  end

  private
    attr_reader :zip, :call

  def call(zip)
    conn = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?format=json&show=storeType,name,city,hours,distance&pageSize=25&apiKey=7a3heu7emrjz6qbsugmepbv6")
    response = JSON.parse(conn.body, symoblize_names: true)
  end

end
