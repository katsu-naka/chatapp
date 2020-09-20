class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false #roomsテーブルにはroom名のみ保存する。
      t.timestamps
    end
  end
end
