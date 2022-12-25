class Routine < ApplicationRecord
  belongs_to :user
  has_many :workouts
  has_many :routine_exercises
  has_many :exercises, through: :routine_exercises

  accepts_nested_attributes_for :routine_exercises, allow_destroy: true
  # has_and_belongs_to_many :exercises
end
