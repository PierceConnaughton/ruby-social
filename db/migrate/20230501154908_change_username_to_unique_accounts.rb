class ChangeUsernameToUniqueAccounts < ActiveRecord::Migration[7.0]
  def change
    change_column(:accounts, :username, :string, unique: true)
  end
end
