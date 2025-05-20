class CreateOperations < ActiveRecord::Migration[8.0]
  def change
    create_table :operations do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
