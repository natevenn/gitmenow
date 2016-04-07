require 'rails_helper'


RSpec.describe User, type: :model do
  context 'from_oauth()' do
    it 'creates a user based off of oauth info from github' do
      User.from_omniauth(user_info)
      user = User.first
      expect(user.name).to eq "Bill Board"
      expect(user.screen_name).to eq "billboard"
      expect(user.location).to eq "Denver, CO"
      expect(user.email).to eq "bill@example.com"
    end
  end
end
