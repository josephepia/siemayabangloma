require "rails_helper"

RSpec.describe IdentificationTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/identification_types").to route_to("identification_types#index")
    end

    it "routes to #new" do
      expect(get: "/identification_types/new").to route_to("identification_types#new")
    end

    it "routes to #show" do
      expect(get: "/identification_types/1").to route_to("identification_types#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/identification_types/1/edit").to route_to("identification_types#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/identification_types").to route_to("identification_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/identification_types/1").to route_to("identification_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/identification_types/1").to route_to("identification_types#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/identification_types/1").to route_to("identification_types#destroy", id: "1")
    end
  end
end
