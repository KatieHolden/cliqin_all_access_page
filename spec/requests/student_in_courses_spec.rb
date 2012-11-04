require 'spec_helper'

describe "StudentInCourses" do
  describe "GET /student_in_courses" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get student_in_courses_path
      response.status.should be(200)
    end
  end
end
