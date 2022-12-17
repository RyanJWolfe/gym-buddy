require 'rails_helper'

RSpec.describe "routines/show", type: :view do
  before(:each) do
    assign(:routine, Routine.create!(
      user: nil,
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
  end
end
