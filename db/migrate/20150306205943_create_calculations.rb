class CreateCalculations < ActiveRecord::Migration
  def change
    create_table :calculations do |t|
      t.integer   :yearly_operating_costs
      t.integer   :fixed_costs
      t.integer   :investment_estimate
      t.timestamps null: false
    end
  end
end
