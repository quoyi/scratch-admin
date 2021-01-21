class AddAncestryToCategories < ActiveRecord::Migration[6.1]
  def change
    remove_index :categories, [:superior_id, :code], unique: true, if_exists: true
    remove_index :categories, [:superior_id, :name], unique: true, if_exists: true
    remove_index :categories, column: :superior_id, if_exists: true
    remove_column :categories, :superior_id, :integer, if_exists: true

    add_column :categories, :ancestry, :string
    add_column :categories, :ancestry_depth, :integer, default: 0
    add_column :categories, :children_count, :integer, default: 0
    add_index :categories, :ancestry
    add_index :categories, [:ancestry, :code], unique: true
    add_index :categories, [:ancestry, :name], unique: true
  end
end
