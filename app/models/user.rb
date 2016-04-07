class User < ActiveRecord::Base
  include Scraper

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid = auth_info[:uid]
      new_user.name = auth_info[:info][:name]
      new_user.location = auth_info[:extra][:raw_info][:location]
      new_user.email = auth_info[:extra][:raw_info][:email]
      new_user.screen_name = auth_info[:info][:nickname]
      new_user.oauth_token = auth_info[:credentials][:token]
      new_user.image = auth_info[:info][:image]
      new_user.created = auth_info[:extra][:raw_info][:created_at]
    end
  end

  def account_created
    created.strftime("%d%d%Y")
  end
end
