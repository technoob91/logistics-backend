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

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :delivery_rate
end
