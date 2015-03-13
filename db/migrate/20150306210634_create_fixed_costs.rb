class CreateFixedCosts < ActiveRecord::Migration
  def change
    create_table :fixed_costs do |t|
      t.integer   :rent
      t.integer   :security_deposit
      t.integer   :construction_cost
      t.integer   :training_equipment_cost
      t.integer   :av_equipment_cost
      t.integer   :architect_cost

      t.integer   :employee_id
      t.integer   :estimate_id
      
      t.timestamps null: false
    end
  end
end
