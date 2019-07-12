class Product < ApplicationRecord
  attr_accessor :delivery_rate
  belongs_to :station
  belongs_to :category

  def delivery_rate
    @rate
  end

  def delivery_rate=(val)
    @rate = val
  end
end
