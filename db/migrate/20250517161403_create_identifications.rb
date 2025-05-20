class CreateIdentifications < ActiveRecord::Migration[8.0]
  def change
    create_table :identifications do |t|
      t.references :user, null: false, foreign_key: true
      t.references :identification_type, null: false, foreign_key: true
      t.string :number

      t.timestamps
    end
  end
end
