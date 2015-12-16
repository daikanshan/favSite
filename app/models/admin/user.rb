class Admin::User < ActiveRecord::Base
  has_many :sites
  has_many :categories
  has_secure_password
end
