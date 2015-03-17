class FixedCost < ActiveRecord::Base
  belongs_to :employee
  has_one    :studio, :through => :employee
  has_one    :estimate

  def calculate_sum

    fixed_cost = Estimate.purge_unwanted_attributes(self)
    # binding.pry
    sum = 0
    fixed_cost.each do |attribute,value|
      sum += value if value != nil
    end
    return sum
  end

  def generate_estimate_params
    estimate_params = Estimate.purge_unwanted_attributes(self)
    estimate_params['fc_sum'] = self.calculate_sum
    return estimate_params
  end
  


end
