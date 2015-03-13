class Employee < ActiveRecord::Base
  has_many    :fixed_costs
  has_many    :operating_costs

  belongs_to  :studio
end
