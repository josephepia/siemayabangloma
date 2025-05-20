class CreateIdentificationTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :identification_types do |t|
      t.string :name
      t.string :abbreviation
      t.text :description

      t.timestamps
    end
    add_index :identification_types, :name, unique: true
  end
end
