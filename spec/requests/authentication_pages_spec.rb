require 'spec_helper'

	describe "Authentication" do

  		subject { page }

  		describe "instructorsignin page" do
    		before { visit instructorsignin_path }

    		describe "with valid information" do
      			let(:instructor) { FactoryGirl.create(:instructor) }
      			before do
        			fill_in "login",    with: instructor.login
        			fill_in "Password", with: instructor.password
        			click_button "Sign in"
      			end

      			it { should have_selector('title', text: instructor.login) }
      			it { should have_link('Profile', href: instructor_path(instructor)) }
      			it { should have_link('Sign out', href: instructorsignout_path) }
      			it { should_not have_link('Sign in', href: instructorsignin_path) }
    		end
    		
    		describe "with invalid information" do
    			before { click_button "Sign in" }

				it { should have_selector('h1',    text: 'Sign in') }      			
    			it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    		end
  		end
	end


