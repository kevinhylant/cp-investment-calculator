class CreateActivityTypes < ActiveRecord::Migration
  def change
    create_table :activity_types do |t|
      t.string     :spin
      t.string     :strength_training
      t.string     :barre
      t.string     :yoga
      t.string     :dance
      t.string     :pilates
      t.string     :other

      t.integer    :studio_id

      t.timestamps null: false
    end
  end
end
