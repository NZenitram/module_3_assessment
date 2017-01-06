class StoresController < ApplicationController

  def show
    binding.pry
    @store = params
  end
end
