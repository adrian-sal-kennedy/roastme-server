class CreateFollowingsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :followings_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :following, null: false, foreign_key: true

      t.timestamps
    end
  end
end
