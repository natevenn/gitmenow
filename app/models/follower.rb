class Follower
  attr_reader :login

  def initialize(follower)
    @login = follower[:login]
  end

  def self.all(user)
    service = GithubService.new(user)
    service.followers.map do |follower|
      Follower.new(follower)
    end
  end
end
