class PushEvent
  attr_reader :message, :created_at

  def initialize(event)
    @message = event[:payload][:commits][0][:message]
    @created_at = event[:created_at]
  end

  def self.all(user)
    service = GithubService.new(user)
    service.events.map do |event|
      if event[:type] == "PushEvent"
        PushEvent.new(event)
      end
    end.compact
  end

  def format_date
    date = Date.parse(created_at)
    date.strftime('%b%a%Y')
  end
end
