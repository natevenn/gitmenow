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
    @forks = repo[:forks]
    @updated = repo[:updated_at]
    @language = repo[:language]
    @url = repo[:html_url]
  end

  def self.all(user)
    service = GithubService.new(user)
    unsorted_repos = service.repos.map do |repo|
      Repo.new(repo)
    end
    sort_repos_by_date(unsorted_repos)
  end

  def self.sort_repos_by_date(repos)
    repos.sort_by do |repo|
      repo.updated
    end.reverse
  end
end
