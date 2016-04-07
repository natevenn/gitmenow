class GithubService
  attr_reader :connection

  def initialize(user)
    @connection = Faraday.new("https://api.github.com/users/#{user.screen_name}")
    connection.params["access_token"] = "#{user.oauth_token}"
  end

  def following
    parse(connection.get("following"))
  end

  def followers
    parse(connection.get("followers"))
  end

  def repos
    parse(connection.get("repos"))
  end

  def gists
    parse(connection.get("gists"))
  end

  def organizations
    parse(connection.get("orgs"))
  end

  def events
    parse(connection.get("events"))
  end

  private

    def parse(response)
      JSON.parse(response.body, object_class: OpenStruct)
    end

    def connection
      @connection
    end
end
