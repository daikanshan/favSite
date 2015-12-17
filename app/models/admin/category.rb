class Admin::Category < ActiveRecord::Base
  has_many :sites,dependent: :delete_all
  belongs_to :user
end
