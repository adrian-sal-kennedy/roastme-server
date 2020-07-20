class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :private_messages do |t|
      t.references :followed
      t.references :following
    end
    # Rails 5+ only: add foreign keys
    add_foreign_key :private_messages, :users, column: :followed_id, primary_key: :id
    add_foreign_key :private_messages, :users, column: :following_id, primary_key: :id
  end
end
