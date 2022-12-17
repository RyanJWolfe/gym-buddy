require 'rails_helper'

RSpec.describe "workout_sets/show", type: :view do
  before(:each) do
    assign(:workout_set, WorkoutSet.create!(
      workout: nil,
      weight: 2,
      reps: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
