class Studio < ActiveRecord::Base
  has_many :employees
  has_one  :activity_type

  has_many :operating_costs, :through => :employees
  has_many :fixed_costs, :through => :employees
  
end
