class CreateFixedCosts < ActiveRecord::Migration
  def change
    create_table :fixed_costs do |t|
      t.integer   :rent
      t.integer   :security_deposit
      t.integer   :build_out_cost
      t.integer   :training_equipment_cost
      t.integer   :av_equipment_cost
      t.integer   :architect_cost
      
      t.timestamps null: false
    end
  end
end
