# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name

end
