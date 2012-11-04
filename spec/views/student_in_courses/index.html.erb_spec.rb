require 'spec_helper'

describe "student_in_courses/index" do
  before(:each) do
    assign(:student_in_courses, [
      stub_model(StudentInCourse,
        :student_ID => 1,
        :course_ID => 2
      ),
      stub_model(StudentInCourse,
        :student_ID => 1,
        :course_ID => 2
      )
    ])
  end

  it "renders a list of student_in_courses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
