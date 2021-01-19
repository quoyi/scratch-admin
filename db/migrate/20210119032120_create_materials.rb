class CreateMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :materials do |t|
      t.string :code
      t.string :name
      t.integer :status, default: 0
      t.integer :mold, default: 0
      t.bigint :used, default: 0
      t.json :info
      t.belongs_to :category
      t.belongs_to :uploader

      t.timestamps
    end
    add_index :materials, :code, unique: true
    add_index :materials, :name, unique: true
  end
end
