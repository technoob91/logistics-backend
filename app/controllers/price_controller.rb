class PriceController < ApplicationController
  def get_prices
    products = PriceService.new.calculate_delivery_rate(params)
    render(json: products)
  end
end
