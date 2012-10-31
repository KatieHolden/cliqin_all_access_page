require 'spec_helper'

describe "Student pages" do

  subject { page }

  describe "signup page" do
    before { visit studentsignup_path }

    it { should have_selector('h1',    :text => 'New Student') }
  end
end