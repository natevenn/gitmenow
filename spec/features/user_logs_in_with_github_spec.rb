require 'rails_helper'
require "rack_session_access/capybara"

RSpec.feature "UserLogsInWithGithub", type: :feature do

  before do
    stub_omniauth
  end

  scenario "A user can click the login with github link and is redirected user show" do
    Capybara.app = Gitmenow::Application

    visit '/'
    click_on "Log in with Github"
    expect(current_path).to eq '/dashboard'
    expect(page).to have_content "Welcome billboard"
    expect(page).to have_link "Logout"
    click_on "Logout"
    expect(current_path).to eq '/'
  end
end
