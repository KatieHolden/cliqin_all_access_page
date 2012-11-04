require 'spec_helper'

describe "student_in_courses/new" do
  before(:each) do
    assign(:student_in_course, stub_model(StudentInCourse,
      :student_ID => 1,
      :course_ID => 1
    ).as_new_record)
  end

  it "renders new student_in_course form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => student_in_courses_path, :method => "post" do
      assert_select "input#student_in_course_student_ID", :name => "student_in_course[student_ID]"
      assert_select "input#student_in_course_course_ID", :name => "student_in_course[course_ID]"
    end
  end
end
