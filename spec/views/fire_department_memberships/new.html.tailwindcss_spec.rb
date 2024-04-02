require 'rails_helper'

RSpec.describe "fire_department_memberships/new", type: :view do
  before(:each) do
    assign(:fire_department_membership, FireDepartmentMembership.new(
      fire_department: nil,
      member: nil,
      role: 1,
      status: 1
    ))
  end

  it "renders new fire_department_membership form" do
    render

    assert_select "form[action=?][method=?]", fire_department_memberships_path, "post" do

      assert_select "input[name=?]", "fire_department_membership[fire_department_id]"

      assert_select "input[name=?]", "fire_department_membership[member_id]"

      assert_select "input[name=?]", "fire_department_membership[role]"

      assert_select "input[name=?]", "fire_department_membership[status]"
    end
  end
end
