require 'spec_helper'

describe "student_in_courses/show" do
  before(:each) do
    @student_in_course = assign(:student_in_course, stub_model(StudentInCourse,
      :student_ID => 1,
      :course_ID => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
