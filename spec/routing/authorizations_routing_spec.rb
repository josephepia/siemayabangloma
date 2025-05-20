require "rails_helper"

RSpec.describe AuthorizationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/authorizations").to route_to("authorizations#index")
    end

    it "routes to #new" do
      expect(get: "/authorizations/new").to route_to("authorizations#new")
    end

    it "routes to #show" do
      expect(get: "/authorizations/1").to route_to("authorizations#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/authorizations/1/edit").to route_to("authorizations#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/authorizations").to route_to("authorizations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/authorizations/1").to route_to("authorizations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/authorizations/1").to route_to("authorizations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/authorizations/1").to route_to("authorizations#destroy", id: "1")
    end
  end
end
