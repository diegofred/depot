class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    byebug
    puts 2
  end
end
