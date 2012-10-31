require 'spec_helper'

describe "Instructor pages" do

  subject { page }

  describe "instructorsignup page" do
    before { visit instructorsignup_path }

    it { should have_selector('h1',    :text => 'New Instructor') }
  end
end