require 'rails_helper'

RSpec.describe "workouts/edit", type: :view do
  let(:workout) {
    Workout.create!(
      user: nil,
      routine: nil
    )
  }

  before(:each) do
    assign(:workout, workout)
  end

  it "renders the edit workout form" do
    render

    assert_select "form[action=?][method=?]", workout_path(workout), "post" do

      assert_select "input[name=?]", "workout[user_id]"

      assert_select "input[name=?]", "workout[routine_id]"
    end
  end
end
