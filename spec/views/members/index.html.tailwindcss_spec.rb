require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        first_name: "First Name",
        last_name: "Last Name",
        address: "Address",
        email: "Email",
        phone: "Phone",
        member_code: "Member Code",
        role: "Role"
      ),
      Member.create!(
        first_name: "First Name",
        last_name: "Last Name",
        address: "Address",
        email: "Email",
        phone: "Phone",
        member_code: "Member Code",
        role: "Role"
      )
    ])
  end

  it "renders a list of members" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Address".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Member Code".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Role".to_s), count: 2
  end
end
