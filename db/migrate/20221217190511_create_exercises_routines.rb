class CreateExercisesRoutines < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises_routines do |t|
      t.references :exercise, null: false, foreign_key: true
      t.references :routine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
