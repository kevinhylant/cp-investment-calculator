class MyGenerator
 
  def self.fixed_costs
    fixed_costs = {
      "training_equipment_cost" => ['Training Equipment',
                            {   '5-10K' => 7500,
                               '10-25K' => 17500,
                               '25-50K' => 37500,
                               '50-75K' => 62500,
                               'Other' => 42
                            }
                          ],
      "av_equipment_cost" => ['AV Equipment',
                            {   '5-10K'  => 7500,
                               '10-20K' => 15000,
                               '20-30K' => 25000,
                               'Other' => 42
                            }
                          ],
      "construction_cost" => ['Construction',
                            {  '25-50K'  => 37500,
                               '50-75K'  => 62500,
                               '75-125K' => 100000,
                               '125-175K'=> 150000,
                               'Other'   => 42
                            }
                          ],
      "monthly_rent" =>           ['Monthly Rent',
                            {  '5-10K'  => 7500,
                               '10-15K' => 12500,
                               '15-20K' => 17500,
                               '20-25K' => 22500,
                               '25-30K' => 27500,
                               'Other' => 42
                            }
                          ],
      "architect_cost" => ['Architect',
                            {   '5-10K'  => 7500,
                               '10-20K' => 15000,
                               '20-30K' => 25000,
                               'Other' => 42
                            }
                          ],
      "security_deposit" => ['Security Deposit',
                          {   '15-30K'=> 22500,
                             '30-45K' => 37500,
                             '45-60K' => 52500,
                             '60-75K' => 67500,
                             '75-90K' => 82500,
                             'Other' => 42
                            }
                          ]}
    return fixed_costs
  end

  def self.operating_costs
    operating_costs = {
      "avg_instructor_per_class_pay" => 'Per Class Pay',
      "avg_monthly_classes" => '# of Classes',
      "front_desk_hourly_pay" => 'Hourly Pay',
      "avg_monthly_front_desk_hours" => 'Hours',
      "employee_monthly_salary" => 'Salary',
      "salaried_employees_count" => '# on Salary',
      "accountant_and_payroll_monthly_pay" => 'Accounting',
      "laundry_service_monthly_cost" => 'Laundry',
      "cleaning_service_monthly_cost" => 'Cleaning Service',
      "other_operating_costs" => 'Other Costs'
    }
    return operating_costs
  end

  def self.convert_param_vals_to_i(params)
    fixed_params = {}
    params.each do |k,v|
      fixed_params[k] = v.gsub(',',"").to_i
    end
    return fixed_params
  end

  def self.activities
    activities = {'Spin'=>'spin','Yoga'=>'yoga','Strength Training'=>'strength_training','Barre'=>'barre','Pilates'=>'pilates','Dance'=>'dance',"Other"=>'other'}
    return activities
  end
    
  def self.cities
    cities = ['Atlanta', 'Austin', 'Baltimore', 'Boston', 'Charlotte', 'Chicago', 'Colombus', 'Dallas/FortWorth', 'Denver', 'Houston', 'Kansas City', 'Las Vegas', 'Los Angeles', 'Miami', 'Minneapolis', 'Nashville', 'New York', 'Orlando', 'Philadelphia', 'Pheonix/Scottsdale', 'Portland', 'Raleigh', 'San Diego', 'San Francisco', 'Seattle', 'St. Louis', 'Tampa', 'Washington D.C.']
    return cities
  end
end
