class Organization

  def initialize(org)
    @image = org[:avatar_url]
    @description = org[:description]
    @url = org[:url]
  end

  def self.all(user)
    if service = GithubService.new(user)
      service.organizations.each do |org|
        Organization.new(org)
      end
    end
  end
end
