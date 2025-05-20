class CreateResources < ActiveRecord::Migration[8.0]
  def change
    create_table :resources do |t|
      t.string :name,         null: false
      t.text :description
      t.string :entity_type,  null: false
      t.boolean :is_visible,  default: false

      t.timestamps
    end
    add_index :resources, :entity_type, unique: true
  end
end
