require 'rails_helper'

RSpec.describe "districts/show", type: :view do
  before(:each) do
    assign(:district, District.create!(
      name: "Name",
      code: "Code",
      region: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(//)
  end
end
