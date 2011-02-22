# == Schema Information
# Schema version: 20110222171419
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :email
  
  email_regex =/\A[a-z0-9][\w+\-.]+@[a-z\d.]+\.[a-z]+\z/i
  
  validates :name,  :presence   => true, 
                    :length     => { :maximum => 50 }
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
end
