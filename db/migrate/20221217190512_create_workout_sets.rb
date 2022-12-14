class CreateWorkoutSets < ActiveRecord::Migration[7.0]
  def change
    create_table :workout_sets do |t|
      t.references :workout, null: false, foreign_key: true
      t.references :routine_exercise, null: false, foreign_key: true
      t.integer :weight
      t.integer :reps

      t.timestamps
    end
  end
end
