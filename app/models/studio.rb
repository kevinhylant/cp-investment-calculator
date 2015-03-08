class Studio < ActiveRecord::Base
  has_many :operating_costs
  has_many :fixed_costs
  has_many :calculations
  
end
