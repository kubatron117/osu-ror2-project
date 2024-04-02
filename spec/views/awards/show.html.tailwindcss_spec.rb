require 'rails_helper'

RSpec.describe "awards/show", type: :view do
  before(:each) do
    assign(:award, Award.create!(
      name: "Name",
      award_kind: 2,
      dependent_on_award: 3,
      minimum_service_years: 4,
      minimum_age_for_award: 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
  end
end
