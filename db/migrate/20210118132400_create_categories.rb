class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :code
      t.string :name
      t.integer :status, default: 0
      t.text :desc
      t.belongs_to :superior
      t.references :classifiable, polymorphic: true

      t.timestamps
    end
    add_index :categories, [:superior_id, :code], unique: true
    add_index :categories, [:superior_id, :name], unique: true
  end
end
