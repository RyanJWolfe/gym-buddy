require 'rails_helper'

RSpec.describe "workouts/index", type: :view do
  before(:each) do
    assign(:workouts, [
      Workout.create!(
        user: nil,
        routine: nil
      ),
      Workout.create!(
        user: nil,
        routine: nil
      )
    ])
  end

  it "renders a list of workouts" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
