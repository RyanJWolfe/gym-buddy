require 'rails_helper'

RSpec.describe "exercises/edit", type: :view do
  let(:exercise) {
    Exercise.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:exercise, exercise)
  end

  it "renders the edit exercise form" do
    render

    assert_select "form[action=?][method=?]", exercise_path(exercise), "post" do

      assert_select "input[name=?]", "exercise[name]"
    end
  end
end
