require 'rails_helper'

RSpec.describe "fire_department_memberships/index", type: :view do
  before(:each) do
    assign(:fire_department_memberships, [
      FireDepartmentMembership.create!(
        fire_department: nil,
        member: nil,
        role: 2,
        status: 3
      ),
      FireDepartmentMembership.create!(
        fire_department: nil,
        member: nil,
        role: 2,
        status: 3
      )
    ])
  end

  it "renders a list of fire_department_memberships" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
  end
end
