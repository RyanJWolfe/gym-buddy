require 'rails_helper'

RSpec.describe "workout_sets/new", type: :view do
  before(:each) do
    assign(:workout_set, WorkoutSet.new(
      workout: nil,
      weight: 1,
      reps: 1
    ))
  end

  it "renders new workout_set form" do
    render

    assert_select "form[action=?][method=?]", workout_sets_path, "post" do

      assert_select "input[name=?]", "workout_set[workout_id]"

      assert_select "input[name=?]", "workout_set[weight]"

      assert_select "input[name=?]", "workout_set[reps]"
    end
  end
end
