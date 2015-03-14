class Employee < ActiveRecord::Base
  has_many    :fixed_costs
  has_many    :operating_costs
  belongs_to  :studio

  # validates_presence_of :name, :position

  def generate_estimate_params
    purged_attributes = Estimate.purge_unwanted_attributes(self)
    estimate_params = {}
    
    estimate_params['employee_name']     = purged_attributes['name']
    estimate_params['employee_position'] = purged_attributes['position']

    return estimate_params
  end

end
