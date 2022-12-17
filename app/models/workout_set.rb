class WorkoutSet < ApplicationRecord
  belongs_to :workout
  belongs_to :routine_exercise
end
