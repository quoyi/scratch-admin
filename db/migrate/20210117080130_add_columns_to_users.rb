class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :nick, :string
    add_column :users, :mobile, :string
    add_column :users, :gender, :integer, default: 0
    add_column :users, :token, :string
    add_column :users, :status, :integer, default: 0
    add_column :users, :role, :integer, default: 0
    add_column :users, :guest, :boolean, default: false

    add_index :users, :nick
    add_index :users, :guest
    add_index :users, :mobile, unique: true
    add_index :users, :token, unique: true
  end
end
