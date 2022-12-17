require 'rails_helper'

RSpec.describe "workout_sets/edit", type: :view do
  let(:workout_set) {
    WorkoutSet.create!(
      workout: nil,
      weight: 1,
      reps: 1
    )
  }

  before(:each) do
    assign(:workout_set, workout_set)
  end

  it "renders the edit workout_set form" do
    render

    assert_select "form[action=?][method=?]", workout_set_path(workout_set), "post" do

      assert_select "input[name=?]", "workout_set[workout_id]"

      assert_select "input[name=?]", "workout_set[weight]"

      assert_select "input[name=?]", "workout_set[reps]"
    end
  end
end
