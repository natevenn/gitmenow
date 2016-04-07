class Gist

  def self.all(user)
    service = GithubService.new(user)
    service.gists
  end
end
