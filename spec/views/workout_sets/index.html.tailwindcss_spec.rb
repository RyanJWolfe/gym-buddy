require 'rails_helper'

RSpec.describe "workout_sets/index", type: :view do
  before(:each) do
    assign(:workout_sets, [
      WorkoutSet.create!(
        workout: nil,
        weight: 2,
        reps: 3
      ),
      WorkoutSet.create!(
        workout: nil,
        weight: 2,
        reps: 3
      )
    ])
  end

  it "renders a list of workout_sets" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
  end
end
