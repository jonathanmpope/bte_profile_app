class CreateExercise < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :type
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
