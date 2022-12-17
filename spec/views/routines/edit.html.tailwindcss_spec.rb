require 'rails_helper'

RSpec.describe "routines/edit", type: :view do
  let(:routine) {
    Routine.create!(
      user: nil,
      name: "MyString"
    )
  }

  before(:each) do
    assign(:routine, routine)
  end

  it "renders the edit routine form" do
    render

    assert_select "form[action=?][method=?]", routine_path(routine), "post" do

      assert_select "input[name=?]", "routine[user_id]"

      assert_select "input[name=?]", "routine[name]"
    end
  end
end
