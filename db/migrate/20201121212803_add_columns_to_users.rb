class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :status, :integer
    add_column :users, :prefession, :string
    add_column :users, :service, :string
    add_column :users, :user_type, :integer
  end
end
