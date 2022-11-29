class AddProfiletoExercises < ActiveRecord::Migration[5.2]
  def change
    add_reference :exercises, :profile, foreign_key: true
  end
end
