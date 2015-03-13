class MyGenerator
 
  def self.fixed_costs
    fixed_costs = {
      "training_equipment_cost" => ['Training Equipment',
                            {   '5-10' => 7500,
                               '10-25' => 17500,
                               '25-50' => 37500,
                               '50-75' => 62500,
                               'Other' => 100000
                            }
                          ],
      "av_equipment_cost" => ['AV Equipment',
                            {   '5-10'  => 7500,
                               '10-20' => 15000,
                               '20-30' => 25000,
                               'Other' => 50000
                            }
                          ],
      "construction_cost" => ['Construction',
                            {  '25-50'  => 37500,
                               '50-75'  => 62500,
                               '75-125' => 100000,
                               '125-175'=> 150000,
                               'Other'  => 200000
                            }
                          ],
      "rent" =>           ['Monthly Rent',
                            {  '5-10'  => 7500,
                               '10-15' => 12500,
                               '15-20' => 17500,
                               '20-25' => 22500,
                               '25-30' => 27500,
                               'Other' => 40000
                            }
                          ],
      "architect_cost" => ['Architect',
                            {   '5-10'  => 7500,
                               '10-20' => 15000,
                               '20-30' => 25000,
                               'Other' => 50000
                            }
                          ],
                  }
    # security deposit not in form, but = rent*3
    return fixed_costs
  end

  def self.operating_costs
    operating_costs = {
      "avg_instructor_per_class_pay" => 'Instructor Per Class Pay',
      "avg_monthly_classes" => 'Classes Per Month',
      "front_desk_hourly_pay" => 'Front Desk Hourly Pay',
      "avg_monthly_front_desk_hours" => 'Monthly Front Desk Hours',
      "employee_monthly_salary" => 'Monthly Pay for Salaried Employees',
      "salaried_employees_count" => 'Number of Salaried Employees',
      "laundry_service_monthly_cost" => 'Monthly Laundry Cost',
      "cleaning_service_monthly_cost" => 'Monthly Cleaning Service Cost',
      "accountant_and_payroll_monthly_pay" => 'Monthly Accounting & Payroll Cost',
      "other_operating_costs" => 'Other Monthly Operating Costs'
    }
    return operating_costs
  end

  def self.convert_param_vals_to_i(params)
    fixed_params = {}
    params.each do |k,v|
      fixed_params[k] = v.to_i
    end
    if fixed_params['rent']
      rent = fixed_params['rent']
      fixed_params['security_deposit'] = rent*3
    end
    return fixed_params
  end

  def self.activities
    activities = {'Spin'=>'spin','Yoga'=>'yoga','Strength Training'=>'strength_training','Barre'=>'barre','Pilates'=>'pilates','Dance'=>'dance'}
    return activities
  end
    
  def self.cities
    cities = ['Atlanta', 'Austin', 'Baltimore', 'Boston', 'Charlotte', 'Chicago', 'Colombus', 'Dallas/FortWorth', 'Denver', 'Houston', 'Kansas City', 'Las Vegas', 'Los Angeles', 'Miami', 'Minneapolis', 'Nashville', 'New York', 'Orlando', 'Philadelphia', 'Pheonix/Scottsdale', 'Portland', 'Raleigh', 'San Diego', 'San Francisco', 'Seattle', 'St. Louis', 'Tampa', 'Washington D.C.']
    return cities
  end
end
