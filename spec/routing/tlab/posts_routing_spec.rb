require "spec_helper"

module Tlab
  describe PostsController do
    routes { Tlab::Engine.routes }
    describe "routing" do

      it "routes to #index" do
        get("/").should route_to("tlab/posts#index")
      end

      it "routes to #new" do
        get("/new").should route_to("tlab/posts#new")
      end

      it "routes to #show" do
        get("/1").should route_to("tlab/posts#show", :id => "1")
      end

      it "routes to #edit" do
        get("/1/edit").should route_to("tlab/posts#edit", :id => "1")
      end

      it "routes to #create" do
        post("/").should route_to("tlab/posts#create")
      end

      it "routes to #update" do
        put("/1").should route_to("tlab/posts#update", :id => "1")
      end

      it "routes to #destroy" do
        delete("/1").should route_to("tlab/posts#destroy", :id => "1")
      end

    end
  end
end
