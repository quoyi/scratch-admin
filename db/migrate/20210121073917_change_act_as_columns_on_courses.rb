class ChangeActAsColumnsOnCourses < ActiveRecord::Migration[6.1]
  def change
    remove_index :courses, column: :superior_id, if_exists: true
    remove_column :courses, :superior_id, :integer, if_exists: true

    remove_index :courses, column: :prev_id, if_exists: true
    remove_column :courses, :prev_id, :integer, if_exists: true

    remove_column :courses, :juniors_count, :integer, if_exists: true

    # ancestry
    add_column :courses, :ancestry_depth, :integer, default: 0
    add_column :courses, :children_count, :integer, default: 0
    add_column :courses, :ancestry, :string
    add_index :courses, :ancestry
    add_index :courses, [:ancestry, :code], unique: true, name: 'by_ancestry_code'
    add_index :courses, [:ancestry, :name], unique: true, name: 'by_ancestry_name'

    # act_as_list
    add_column :courses, :position, :integer, default: 0
  end
end
