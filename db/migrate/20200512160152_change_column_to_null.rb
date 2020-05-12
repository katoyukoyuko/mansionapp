class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :bulletin_boards, :title, false
    change_column_null :bulletin_boards, :content, false
    change_column_null :bulletin_boards, :user_id, false

    change_column_null :users, :name, false
    change_column_null :users, :role, false
  end
end
