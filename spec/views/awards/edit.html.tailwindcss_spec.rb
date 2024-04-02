require 'rails_helper'

RSpec.describe "awards/edit", type: :view do
  let(:award) {
    Award.create!(
      name: "MyString",
      award_kind: 1,
      dependent_on_award: 1,
      minimum_service_years: 1,
      minimum_age_for_award: 1
    )
  }

  before(:each) do
    assign(:award, award)
  end

  it "renders the edit award form" do
    render

    assert_select "form[action=?][method=?]", award_path(award), "post" do

      assert_select "input[name=?]", "award[name]"

      assert_select "input[name=?]", "award[award_kind]"

      assert_select "input[name=?]", "award[dependent_on_award]"

      assert_select "input[name=?]", "award[minimum_service_years]"

      assert_select "input[name=?]", "award[minimum_age_for_award]"
    end
  end
end
