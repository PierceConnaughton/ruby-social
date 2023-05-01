class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.references :follower, null: false, foreign_key: { to_table: :accounts }
      t.references :followee, null: false, foreign_key: { to_table: :accounts }

      t.timestamps
    end
  end
end
