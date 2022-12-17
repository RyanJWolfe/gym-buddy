class Exercise < ApplicationRecord
  # has_and_belongs_to_many :routines
  has_many :routine_exercises
  has_many :routines, through: :routine_exercises
end
