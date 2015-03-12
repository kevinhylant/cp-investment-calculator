class MyGenerator
 
  def self.fixed_costs
    fixed_costs = {
      "rent" =>           ['Monthly Rent',
                            {'<10'    => 10000,
                               '10-15' => 12500,
                               '15-20' => 17500,
                               '20-25' => 22500,
                               '25-30' => 27500,
                               '30+'   => 30000
                            }
                          ],
      "build_out_cost" => ['Build Out',
                            {'<50'    => 50000,
                               '50-75' => 62500,
                               '75-125' => 100000,
                               '125-175' => 150000,
                               '175+' => 175000
                            }
                          ],
      "av_equipment_cost" => ['AV Equipment',
                            {'<10'    => 10000,
                               '10-20' => 15000,
                               '20-30' => 25000,
                               '30+' => 30000
                            }
                          ],
      "architect_cost" => ['Architect',
                            {'unknown range' => 10000}
                          ],
      "training_equipment_cost" => ['Training Equipment',
                            {'<10'    => 10000,
                               '10-25' => 17500,
                               '25-50' => 37500,
                               '50-75' => 62500,
                               '75+' => 75000
                            }
                          ]
                  }
    # security deposit not in form, but = rent*3
    return fixed_costs
  end

  def self.operating_costs
    operating_costs = {
      "avg_instructor_per_class_pay" => 'Average Instructor Pay Per Class',
      "avg_monthly_classes" => 'Average Classes Per Month',
      "front_desk_hourly_pay" => 'Front Desk Hourly Pay',
      "avg_monthly_front_desk_hours" => 'Average Monthly Front Desk Hours',
      "laundry_service_monthly_cost" => 'Monthly Laundry Cost',
      "cleaning_service_monthly_cost" => 'Monthly Cleaning Service Cost',
      "accountant_and_payroll_monthly_pay" => 'Monthly Accountant & Payroll Expense',
      "employee_monthly_salary" => 'Average Monthly Pay for Salaried Employees',
      "salaried_employees_count" => 'Number of Salaried Employees',
      "other_operating_costs" => 'Other Monthly Operating Costs'
    }
    return operating_costs
  end

  def self.convert_param_vals_to_i(params)
    fixed_params = {}
    params.each do |k,v|
      fixed_params[k] = v.to_i
    end
    rent = fixed_params['rent']
    fixed_params['security_deposit'] = rent*3
    return fixed_params
  end

  def self.activities
    activities = ['Spin','Yoga','Strength Training','Barre','Pilates','Dance']
    return activities
  end
    
  def self.cities
    cities = ['Atlanta', 'Austin', 'Baltimore', 'Boston', 'Charlotte', 'Chicago', 'Colombus', 'Dallas/FortWorth', 'Denver', 'Houston', 'Kansas City', 'Las Vegas', 'Los Angeles', 'Miami', 'Minneapolis', 'Nashville', 'New York', 'Orlando', 'Philadelphia', 'Pheonix/Scottsdale', 'Portland', 'Raleigh', 'San Diego', 'San Francisco', 'Seattle', 'St. Louis', 'Tampa', 'Washington D.C.']
    return cities
  end
end
