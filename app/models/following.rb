class Following
  attr_reader :name

  def initialize(follow)
    @name = follow[:login]
  end

  def self.all(user)
    service = GithubService.new(user)
    service.following.map do |follow|
      Following.new(follow)
    end
  end
end
