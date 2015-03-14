class CreateOperatingCosts < ActiveRecord::Migration
  def change
    create_table :operating_costs do |t|
      t.integer   :avg_instructor_per_class_pay
      t.integer   :avg_monthly_classes
      t.integer   :front_desk_hourly_pay
      t.integer   :avg_monthly_front_desk_hours
      t.integer   :laundry_service_monthly_cost
      t.integer   :cleaning_service_monthly_cost
      t.integer   :accountant_and_payroll_monthly_pay
      t.integer   :employee_monthly_salary
      t.integer   :salaried_employees_count
      t.integer   :other_operating_costs

      t.integer   :employee_id

      t.timestamps null: false
    end
  end
end
