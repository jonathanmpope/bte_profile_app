class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :type
      t.float :strength_lower_score
      t.float :strength_upper_score
      t.float :power_score
      t.float :strength_score
      t.float :conditioning_extended_capacity_score
      t.float :conditioning_capacity_score
      t.float :conditioning_extended_power_score
      t.float :conditioning_power_score
      t.float :conditioning_score
      t.float :work_capacity_score
      
      t.timestamps
    end
  end
end
