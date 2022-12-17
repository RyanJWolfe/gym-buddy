# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create a user
user = User.find_by(email: 'xryanwolfe@gmail.com')
user ||= User.create!(email: 'xryanwolfe@gmail.com', password: 'password', password_confirmation: 'password')

# Create a routine
user.routines << Routine.find_or_create_by(name: 'Push')

exercise_names = [
  { name: 'Bench Press' },
  { name: 'Squat' },
  { name: 'Deadlift' },
  { name: 'Overhead Press' },
  { name: 'Bent Over Row' },
  { name: 'Pull Up' },
  { name: 'Dip' },
  { name: 'Curl' },
  { name: 'Tricep Extension' },
  { name: 'Leg Curl' },
  { name: 'Leg Extension' },
  { name: 'Calf Raise' },
  { name: 'Shoulder Press' },
  { name: 'Shoulder Shrug' },
  { name: 'Lateral Raise' },
  { name: 'Front Raise' },
  { name: 'Rear Delt Raise' },
  { name: 'Face Pull' },
  { name: 'Chin Up' },
  { name: 'Push Up' },
  { name: 'Sit Up' },
  { name: 'Crunch' },
  { name: 'Leg Raise' },
  { name: 'Plank' },
  { name: 'Lunge' },
  { name: 'Step Up' },
  { name: 'Hip Thrust' },
  { name: 'Glute Bridge' },
  { name: 'Glute Kickback' },
  { name: 'Hip Abduction' },
  { name: 'Hip Adduction' },
  { name: 'Incline Bench Press' },
  { name: 'Decline Bench Press' },
  { name: 'Romanian Deadlift' },
  { name: 'Good Morning' },
  { name: 'Chest fly' },
  { name: 'Lat Pulldown' },
  { name: 'Seated Row' },
  { name: 'Hammer Curl' },
  { name: 'Preacher Curl' },
  { name: 'Skull Crusher' },
  { name: 'Tricep Kickback' },
  { name: 'Leg Press' },
  { name: 'Seated Calf Raise' },
  { name: 'Standing Calf Raise' }
]

exercise_names.each do |exercise_name|
  Exercise.find_or_create_by(exercise_name)
end
