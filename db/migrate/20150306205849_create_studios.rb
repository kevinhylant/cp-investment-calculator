class CreateStudios < ActiveRecord::Migration
  def change
    create_table :studios do |t|
      t.string    :name
      t.string    :hq_city      
      
      t.timestamps null: false
    end
  end
end