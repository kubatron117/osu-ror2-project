require 'rails_helper'

RSpec.describe "fire_department_memberships/show", type: :view do
  before(:each) do
    assign(:fire_department_membership, FireDepartmentMembership.create!(
      fire_department: nil,
      member: nil,
      role: 2,
      status: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
