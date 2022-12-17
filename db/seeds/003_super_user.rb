# Create a user with a Workout and Routine
user = User.find_by(email: 'xryanwolfe@gmail.com')
user ||= User.create!(email: 'xryanwolfe@gmail.com',
                      first_name: 'Ryan',
                      last_name: 'Wolfe',
                      username: 'ryanjwolfe',
                      password: 'password',
                      password_confirmation: 'password')

# Create a routine
routine = Routine.find_or_create_by(name: 'Push')
user.routines << routine

# Create exercises
routine.exercises << Exercise.find_or_create_by(name: 'Bench Press')
routine.exercises << Exercise.find_or_create_by(name: 'Overhead Press')
routine.exercises << Exercise.find_or_create_by(name: 'Dips')
routine.exercises << Exercise.find_or_create_by(name: 'Tricep Pushdowns')
routine.exercises << Exercise.find_or_create_by(name: 'Cable Crossovers')

# Create a workout
workout = Workout.find_or_create_by!(routine:, user:)

# Create workout sets
workout.routine.routine_exercises.each do |exercise|
  workout.workout_sets << WorkoutSet.create!(routine_exercise: exercise,
                                             workout:,
                                             reps: Faker::Number.between(from: 5, to: 12),
                                             weight: Faker::Number.between(from: 10, to: 100))
end
