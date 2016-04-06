class User < ActiveRecord::Base

  def self.from_omniauth(auth_info)
    require "pry"
    binding.pry
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid = auth_info.uid
      new_user.name = auth_info.extra.raw_info.name
      new_user.location = auth_info.extra.raw_info.location
      new_user.email = auth_info.extra.raw_info.email
      new_user.screen_name = auth_info.info.nickname
      new_user.oauth_token = auth_info.credentials.token
      new_user.image = auth_info.info.image
    end
  end

  def service
    GithubService.new(self)
  end

  def repos
    service.repos
  end

  def gists
    service.gists
  end

  def location
    location = service.user_info[:location]
  end
end
