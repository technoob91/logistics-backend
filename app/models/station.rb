class Station < ApplicationRecord
  attr_accessor :time
  has_many :products
  acts_as_mappable :default_units => :kms,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  def time
    @time_val
  end

  def time=(val)
    @time_val = val
  end
end
