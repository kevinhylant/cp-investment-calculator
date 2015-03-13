class FixedCost < ActiveRecord::Base
  belongs_to :employee
  has_one    :studio, :through => :employee
  belongs_to :estimate

  def calculate_sum
    excluded_attributes = ['id','created_at','updated_at','estimate_id','employee_id']
    sum = 0
    self.attributes.each do |attribute,value|
      unless excluded_attributes.include?(attribute)
        sum += value
      end
    end
    return sum
  end

  def generate_estimate_params
    estimate_params = Estimate.purge_unwanted_attributes(self)
    estimate_params['fc_sum'] = self.calculate_sum
    return estimate_params
  end
  


end
