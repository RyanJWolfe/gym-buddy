class WorkoutSet < ApplicationRecord
  belongs_to :workout
  belongs_to :exercises_routine
end
