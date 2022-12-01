class CreateExercise < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :category
      t.string :name
      t.float :value

      t.timestamps
    end
  end
end
