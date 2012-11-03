# == Schema Information
#
# Table name: instructors
#
#  id         :integer          not null, primary key
#  login      :string(255)
#  IP         :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Instructor do

	before do
		@instructor = Instructor.new(:login => "ExampleUser", :IP => "127.0.0.12", :password => "foobar", 
      :password_confirmation => "foobar") 
	end

  	subject { @instructor }

  	it { should respond_to(:login) }
  	it { should respond_to(:IP) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:remember_token) }
    it { should respond_to(:authenticate) }

  	it { should be_valid }

  	describe "when login is not present" do
  		before { @instructor.login = " " }
  		it { should_not be_valid }
  	end

  	describe "when login is already taken" do
    	before do
      		instructor_with_same_login = @instructor.dup
      		instructor_with_same_login.login = @instructor.login.upcase
      		instructor_with_same_login.save
    	end

    it { should_not be_valid }
  	end

    describe "when password is not present" do
      before { @instructor.password = @instructor.password_confirmation = " " }
      it { should_not be_valid }
    end

    describe "when password doesn't match confirmation" do
      before { @instructor.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end

    describe "when password confirmation is nil" do
      before { @instructor.password_confirmation = nil }
      it { should_not be_valid }
    end

    describe "return value of authenticate method" do
      before { @instructor.save }
      let(:found_instructor) { Instructor.find_by_login(@instructor.login) }

      describe "with valid password" do
        it { should == found_instructor.authenticate(@instructor.password) }
      end

      describe "with invalid password" do
        let(:instructor_for_invalid_password) { found_instructor.authenticate("invalid") }

        it { should_not == instructor_for_invalid_password }
        specify { instructor_for_invalid_password.should be_false }
      end
    end

    describe "with a password that's too short" do
      before { @instructor.password = @instructor.password_confirmation = "a" * 5 }
      it { should be_invalid }
    end 

    describe "remember token" do
      before { @instructor.save }
      it { @instructor.remember_token.should_not be_blank }
    end

end
