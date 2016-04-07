class PullEvent
  def initialize(event)

  end

  def self.all(user)
    service = GithubServie.new(user)
    service.events.each do |event|
      if event[:type] == "PullEvents"
        PullEvent.new(event)
      end
    end.compact
  end

end
