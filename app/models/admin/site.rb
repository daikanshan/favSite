class Admin::Site < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  before_create :check_url
  before_update :check_url

  def check_url
    if self.url =~ /(http:\/\/|ftp:\/\/|https:\/\/)/

    else
      self.url = "http://#{self.url}"
    end
  end
end
