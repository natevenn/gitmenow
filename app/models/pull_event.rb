class PullEvent
  attr_reader :title, :merged_at

  def initialize(event)
    @title = event[:payload][:pull_request][:title]
    @merged_at = event[:payload][:pull_request][:merged_at]
  end

  def self.all(user)
    service = GithubService.new(user)
    service.events.map do |event|
      if event[:type] == "PullRequestEvent"
        PullEvent.new(event)
      end
    end.compact
  end
end
