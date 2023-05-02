class AddDestroyDependencyToLikes < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :likes, :accounts
    add_foreign_key :likes, :accounts, on_delete: :cascade
  end
end
