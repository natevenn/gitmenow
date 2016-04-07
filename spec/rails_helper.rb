# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'webmock'
require 'vcr'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

VCR.configure do |c|
  c.allow_http_connections_when_no_cassette = true
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

   def stub_omniauth
    # first, set OmniAuth to run in test mode
    OmniAuth.config.test_mode = true
    # then, provide a set of fake oauth data that
    # omniauth will use when a user tries to authenticate:
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new( user_info)
  end

   def current_user
     User.create(
       id: 3,
       name: "Nate Venn",
       email: "natevenn@gmail.com",
       screen_name: "natevenn",
       uid: "8459012",
       oauth_token: ENV["USER_TOKEN"],
       oauth_token_secret: nil,
       created_at: "Wed, 06 Apr 2016 13:43:19 UTC +00:00",
       updated_at: "Wed, 06 Apr 2016 13:43:19 UTC +00:00",
       image: "https://avatars.githubusercontent.com/u/8459012?v=3",
       location: "Denver, CO",
       created: "Fri, 15 Aug 2014"
     )
   end

   def user_info
     {"provider"=>"github",
      :uid=>"8459012",
      :info=>
     {:nickname=>"billboard",
      "email"=>nil,
      :name=>"Bill Board", "image"=>"https://avatars.githubusercontent.com/u/8459012?v=3",
      "urls"=>{"GitHub"=>"https://github.com/natevenn", "Blog"=>nil}},
     :credentials=>{:token=>ENV['USER_TOKEN'], "expires"=>false},
     :extra=>
     {:raw_info=>
      {"login"=>"billboard",
       "id"=>8459012,
       :avatar_url=>"https://avatars.githubusercontent.com/u/8459012?v=3",
       "gravatar_id"=>"",
       "url"=>"https://api.github.com/users/natevenn",
       "html_url"=>"https://github.com/natevenn",
       "followers_url"=>"https://api.github.com/users/natevenn/followers",
       "following_url"=>"https://api.github.com/users/natevenn/following{/other_user}",
       "gists_url"=>"https://api.github.com/users/natevenn/gists{/gist_id}",
       "starred_url"=>"https://api.github.com/users/natevenn/starred{/owner}{/repo}",
       "subscriptions_url"=>"https://api.github.com/users/natevenn/subscriptions",
       "organizations_url"=>"https://api.github.com/users/natevenn/orgs",
       "repos_url"=>"https://api.github.com/users/natevenn/repos",
       "events_url"=>"https://api.github.com/users/natevenn/events{/privacy}",
       "received_events_url"=>"https://api.github.com/users/natevenn/received_events",
       "type"=>"User",
       "site_admin"=>false,
       :name=>"bill board",
       "company"=>nil,
       "blog"=>nil,
       :location=>"Denver, CO",
       :email=>"bill@example.com",
       "hireable"=>nil,
       "bio"=>nil,
       "public_repos"=>32,
       "public_gists"=>6,
       "followers"=>6,
       "following"=>4,
       :created_at=>"2014-08-15T15:44:20Z",
       :updated_at=>"2016-04-07T04:32:00Z"},
       "all_emails"=>[]}}
   end
end

