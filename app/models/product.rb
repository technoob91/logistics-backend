# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string
#  weight      :bigint
#  station_id  :bigint
#  category_id :bigint
#  created_at  :datetime
#  updated_at  :datetime
#

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
