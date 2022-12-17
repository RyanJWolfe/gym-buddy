class Workout < ApplicationRecord
  belongs_to :user
  belongs_to :routine
  has_many :workout_sets
end
