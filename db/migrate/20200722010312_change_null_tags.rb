class ChangeNullTags < ActiveRecord::Migration[6.0]
  def change
    change_column_null :tags, :tag, false
  end
end
