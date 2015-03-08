class CalculationsController < ApplicationController

  def new
    @activities = ['Spin','Yoga','Strength Training','Barre','Pilates','Dance']
    @cities = ['Atlanta', 'Austin', 'Baltimore', 'Boston', 'Charlotte', 'Chicago', 'Colombus', 'Dallas/FortWorth', 'Denver', 'Houston', 'Kansas City', 'Las Vegas', 'Los Angeles', 'Miami', 'Minneapolis', 'Nashville', 'New York', 'Orlando', 'Philadelphia', 'Pheonix/Scottsdale', 'Portland', 'Raleigh', 'San Diego', 'San Francisco', 'Seattle', 'St. Louis', 'Tampa', 'Washington D.C.']
    @operating_costs = {
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
    @fixed_costs = {
      "rent" => 'Rent',
      "security_deposit" => 'Security Deposit',
      "build_out_cost" => 'Build Out',
      "training_equipment_cost" => 'Training Equipment',
      "av_equipment_cost" => 'AV Equipment',
      "architect_cost" => 'Architect'
    }
  end

  def create
    binding.pry
  end

  def show
  end

  def index
  end

  def update
  end

end
