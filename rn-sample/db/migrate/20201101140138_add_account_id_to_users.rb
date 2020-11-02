class AddAccountIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :account_id, :string, :after => :name
  end
end
