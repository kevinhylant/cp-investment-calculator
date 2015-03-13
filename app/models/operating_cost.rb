class OperatingCost < ActiveRecord::Base
  belongs_to :employee
  has_one    :studio, :through => :employee
  belongs_to :estimate

  def calculate_sum
    oc_hash = Estimate.purge_unwanted_attributes(self)
    
    # cost categories below
    instructor = oc_hash['avg_instructor_per_class_pay']*oc_hash['avg_monthly_classes']
    front_desk = oc_hash['front_desk_hourly_pay']*oc_hash['avg_monthly_front_desk_hours']
    salaried_employee = oc_hash['employee_monthly_salary']*oc_hash['salaried_employees_count']
    laundry = oc_hash['laundry_service_monthly_cost']
    cleaning = oc_hash['cleaning_service_monthly_cost']
    accounting_payroll = oc_hash['accountant_and_payroll_monthly_pay']
    other = oc_hash['other_operating_costs']
    
    oc_sum = (instructor+front_desk+salaried_employee+laundry+cleaning+accounting_payroll+other)
    return oc_sum
  end


  def generate_estimate_params
    estimate_params = Estimate.purge_unwanted_attributes(self)
    estimate_params['oc_sum'] = self.calculate_sum
    return estimate_params
  end
  
end
