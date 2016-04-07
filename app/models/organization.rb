class Organization
  attr_reader :name, :image, :description, :url

  def initialize(org)
    @name = org[:login]
    @image = org[:avatar_url]
    @description = org[:description]
    @url = org[:url]
  end

  def self.all(user)
    if service = GithubService.new(user)
      service.organizations.map do |org|
        Organization.new(org)
      end
    end
  end
end
