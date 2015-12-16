class Admin::Category < ActiveRecord::Base
  has_many :sites
  belongs_to :user
end
