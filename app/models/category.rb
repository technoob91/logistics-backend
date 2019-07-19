# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class Category < ApplicationRecord
  has_many :products
end
