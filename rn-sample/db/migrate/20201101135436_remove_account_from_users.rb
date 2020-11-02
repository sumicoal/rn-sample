class RemoveAccountFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :account, :string
  end
end
