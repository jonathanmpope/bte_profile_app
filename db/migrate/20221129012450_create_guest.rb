class CreateGuest < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.integer :weight

      t.timestamps
    end
  end
end
