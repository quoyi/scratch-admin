class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.string :code
      t.string :name
      t.integer :status, default: 0
      t.text :intro
      t.text :desc
      t.string :namespace
      t.string :controller
      t.string :action

      t.timestamps
    end
    add_index :permissions, :code, unique: true
    add_index :permissions, :name, unique: true
  end

  create_table :permissions_roles, id: false do |t|
    t.belongs_to :permission
    t.belongs_to :role
  end
  add_index :permissions_roles, [:permission_id, :role_id], unique: true
end
