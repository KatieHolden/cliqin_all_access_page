require 'spec_helper'

describe Instructor do

	before do
		@instructor = Instructor.new(:login => 'kaholden',  :IP_address => '127.0.0.12',
                  :password => "foobar", :password_confirmation => "foobar")
	end
	
	subject(@instructor)

	it { should respond_to(:login) }
  it { should respond_to(:IP_address) }
	it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

	it{ should be_valid }

  describe "when login address is already taken" do
    before do
      instructor_with_same_login = @instructor.dup
      instructor_with_same_login.login = @instuctor.login.upcase
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

  describe "with a password that's too short" do
    before { @instructor.password = @instructor.password_confirmation = "a" * 7 }
    it { should be_invalid }
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

end

