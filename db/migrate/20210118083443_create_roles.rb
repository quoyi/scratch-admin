class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.string :code
      t.string :name
      t.integer :status, default: 0
      t.text :intro
      t.text :desc
      t.belongs_to :organization

      t.timestamps
    end
    add_index :roles, [:organization_id, :code], unique: true
    add_index :roles, [:organization_id, :name], unique: true

    create_table :roles_users, id: false do |t|
      t.belongs_to :role
      t.belongs_to :user
    end
    add_index :roles_users, [:role_id, :user_id], unique: true
  end
end
