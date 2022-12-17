# frozen_string_literal: true

# Create exercises
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
