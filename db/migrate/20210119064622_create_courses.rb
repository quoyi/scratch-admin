class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :code
      t.string :name
      t.integer :status, default: 0
      t.integer :mold, default: 0
      t.integer :seq, default: 0
      t.integer :juniors_count, default: 0
      t.text :intro
      t.text :desc
      t.belongs_to :superior
      t.belongs_to :prev
      t.belongs_to :creator

      t.timestamps

      t.index [:superior_id, :code], unique: true
      t.index [:superior_id, :name], unique: true
    end
  end
end
