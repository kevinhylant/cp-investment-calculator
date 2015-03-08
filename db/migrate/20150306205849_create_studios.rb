class CreateStudios < ActiveRecord::Migration
  def change
    create_table :studios do |t|
      t.string    :name
      t.string    :studio_rep_name
      
      t.timestamps null: false
    end
  end
end