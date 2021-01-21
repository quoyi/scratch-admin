class AddAncestryToOrganizations < ActiveRecord::Migration[6.1]
  def change
    add_column :organizations, :ancestry, :string
    add_index :organizations, :ancestry
  end
end
