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
		@instructor = Instructor.new(:login => "ExampleUser", :IP => "127.0.0.12") 
	end

  	subject { @instructor }

  	it { should respond_to(:login) }
  	it { should respond_to(:IP) }

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
end
