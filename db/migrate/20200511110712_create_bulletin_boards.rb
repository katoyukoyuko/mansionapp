class CreateBulletinBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :bulletin_boards do |t|
      t.string :title
      t.string :content
      t.text :memo

      t.timestamps
    end
  end
end
