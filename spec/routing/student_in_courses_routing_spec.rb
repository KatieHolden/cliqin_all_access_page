require "spec_helper"

describe StudentInCoursesController do
  describe "routing" do

    it "routes to #index" do
      get("/student_in_courses").should route_to("student_in_courses#index")
    end

    it "routes to #new" do
      get("/student_in_courses/new").should route_to("student_in_courses#new")
    end

    it "routes to #show" do
      get("/student_in_courses/1").should route_to("student_in_courses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/student_in_courses/1/edit").should route_to("student_in_courses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/student_in_courses").should route_to("student_in_courses#create")
    end

    it "routes to #update" do
      put("/student_in_courses/1").should route_to("student_in_courses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/student_in_courses/1").should route_to("student_in_courses#destroy", :id => "1")
    end

  end
end
