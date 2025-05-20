class CreatePrivileges < ActiveRecord::Migration[8.0]
  def change
    create_table :privileges do |t|
      t.references :permission, null: false, foreign_key: true
      t.references :operation, null: false, foreign_key: true
      t.references :resource, null: false, foreign_key: true

      t.timestamps
    end
  end
end
