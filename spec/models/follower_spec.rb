require 'rails_helper'

describe 'Follower' do
  it 'returns all followers' do
    VCR.use_cassette 'Follower.all(current_user)' do
      followers = Follower.all(current_user)
      follower = followers.first
      expect(followers.count).to eq 6
      expect(follower.login).to eq "MDes41"
      expect(follower.class).to eq Follower
    end
  end
end

