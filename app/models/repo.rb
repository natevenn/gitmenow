class Repo
  attr_reader :name,
              :star_count,
              :fork_count,
              :updated,
              :language,
              :url

  def initialize(repo)
    @name = repo[:name]
    @star_count = repo[:stargazers_count]
    @fork_count = repo[:forks_count]
    @updated = repo[:updated_at]
    @language = repo[:language]
    @url = repo[:html_url]
  end

  def self.all(user)
    service = GithubService.new(user)
    service.repos.map do |repo|
      Repo.new(repo)
    end
  end
end
