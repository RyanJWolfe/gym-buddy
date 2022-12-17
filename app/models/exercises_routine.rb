class ExercisesRoutine < ApplicationRecord
  belongs_to :exercise
  belongs_to :routine
  has_many :workout_sets
end
