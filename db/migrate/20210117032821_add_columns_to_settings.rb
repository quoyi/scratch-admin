class AddColumnsToSettings < ActiveRecord::Migration[6.1]
  def change
    add_column :settings, :desc, :text
    add_column :settings, :preset, :boolean, default: false
  end
end
