require 'spec_helper'

describe "Instructor pages" do

  subject { page }

  describe "profile page" do
  	let(:instructor) { FactoryGirl.create(:instructor) }
    before { visit instructor_path(instructor) }

    it { should have_selector('h1', text: instructor.login) }
   
  end

    describe "signup" do

    before { visit instructorsignup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a instructor" do
        expect { click_button submit }.not_to change(Instructor, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Login",        with: "Example User"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(Instructor, :count).by(1)
      end
    end
  end
end