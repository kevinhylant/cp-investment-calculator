class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.string    :studio_name
      t.string    :studio_hq_city
      t.string    :studio_activities
      
      t.string    :employee_name
      t.string    :employee_position

      t.integer   :fc_sum
      t.integer   :rent
      t.integer   :security_deposit
      t.integer   :construction_cost
      t.integer   :training_equipment_cost
      t.integer   :av_equipment_cost
      t.integer   :architect_cost

      t.integer   :oc_sum
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

      t.integer   :fixed_cost_id
      t.integer   :operating_cost_id

      t.timestamps null: false
    end
  end
end
