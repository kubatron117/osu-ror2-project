require 'rails_helper'

RSpec.describe "members/show", type: :view do
  before(:each) do
    assign(:member, Member.create!(
      first_name: "First Name",
      last_name: "Last Name",
      address: "Address",
      email: "Email",
      phone: "Phone",
      member_code: "Member Code",
      role: "Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Member Code/)
    expect(rendered).to match(/Role/)
  end
end
