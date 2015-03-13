class Studio < ActiveRecord::Base
  has_many :employees
  has_one  :activity_type
  has_many :operating_costs, :through => :employees
  has_many :fixed_costs, :through => :employees

  def generate_estimate_params
    purged_attributes = Estimate.purge_unwanted_attributes(self)
    estimate_params = {}
    
    estimate_params['studio_name']  = purged_attributes['name']
    estimate_params['studio_hq_city']      = purged_attributes['hq_city']

    return estimate_params
  end
  
end
