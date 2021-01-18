class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.integer :status, default: 0
      t.text :desc
      t.text :intro
      t.string :contacts
      t.string :mobile
      t.belongs_to :superior

      t.timestamps
    end

    add_index :organizations, [:code, :superior_id], unique: true
    add_index :organizations, [:name, :superior_id], unique: true
  end
end
