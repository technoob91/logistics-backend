class CategoryController < ApplicationController

  def list
    @category = Category.includes(:products)
    render(json: @category)
  end
end
