class Admin::User < ActiveRecord::Base
  has_many :sites,dependent: :delete_all
  has_many :categories,dependent: :delete_all
  has_secure_password
end
