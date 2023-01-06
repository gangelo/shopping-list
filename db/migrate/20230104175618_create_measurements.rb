class CreateMeasurements < ActiveRecord::Migration[7.0]
  def change
    create_table :measurements do |t|
      t.string :name, limit: 16
      t.string :abbreviation, limit: 8

      t.timestamps
    end
    add_index :measurements, :name, unique: true
    add_index :measurements, :abbreviation, unique: true
  end
end
