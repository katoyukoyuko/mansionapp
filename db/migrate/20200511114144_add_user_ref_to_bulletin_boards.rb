class AddUserRefToBulletinBoards < ActiveRecord::Migration[5.2]
  def change
    add_reference :bulletin_boards, :user, foreign_key: true
  end
end
