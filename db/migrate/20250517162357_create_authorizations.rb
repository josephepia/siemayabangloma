class CreateAuthorizations < ActiveRecord::Migration[8.0]
  def change
    create_table :authorizations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :operation, null: false, foreign_key: true
      t.references :resource, null: false, foreign_key: true

      t.timestamps
    end
  end
end
