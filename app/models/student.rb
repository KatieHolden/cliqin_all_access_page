# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  login      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  attr_accessible :login
end
