require "rails_helper"

RSpec.describe FireDepartmentMembershipsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/fire_department_memberships").to route_to("fire_department_memberships#index")
    end

    it "routes to #new" do
      expect(get: "/fire_department_memberships/new").to route_to("fire_department_memberships#new")
    end

    it "routes to #show" do
      expect(get: "/fire_department_memberships/1").to route_to("fire_department_memberships#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/fire_department_memberships/1/edit").to route_to("fire_department_memberships#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/fire_department_memberships").to route_to("fire_department_memberships#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/fire_department_memberships/1").to route_to("fire_department_memberships#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/fire_department_memberships/1").to route_to("fire_department_memberships#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/fire_department_memberships/1").to route_to("fire_department_memberships#destroy", id: "1")
    end
  end
end
