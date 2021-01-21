class UpdateOrganizationColumns < ActiveRecord::Migration[6.1]
  def change
    remove_index :organizations, [:superior_id, :code], unique: true, if_exists: true
    remove_index :organizations, [:superior_id, :name], unique: true, if_exists: true
    remove_index :organizations, column: :superior_id, if_exists: true
    remove_column :organizations, :superior_id, :integer, if_exists: true

    add_column :organizations, :ancestry_depth, :integer, default: 0
    add_column :organizations, :children_count, :integer, default: 0
    add_index :organizations, [:ancestry, :code], unique: true
    add_index :organizations, [:ancestry, :name], unique: true
  end
end
