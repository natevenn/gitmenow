class GithubService
  attr_reader :connection, :access_token, :user

  def initialize(user)
    @user = user
    @connection = Faraday.new("https://api.github.com/users/#{user.screen_name}/")
    @access_token = "?access_token=#{user.oauth_token}"
  end

  def following
    parse(connection.get("/following + access_token"))
  end

  def followers
    parse(connection.get("/followers + access_token"))
  end

  def repos
    parse(connection.get("repos" + "#{access_token}"))
  end

  def gists
    parse(connection.get("/gists + access_token"))
  end

  def parse(response)
    JSON.parse(response.body, object_class: OpenStruct)
  end
end
