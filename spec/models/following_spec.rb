require 'rails_helper'

describe 'Following' do
  it 'returns user followings' do
    VCR.use_cassette 'Following.all()' do
      followings = Following.all(current_user)
      following = followings.first
      expect(followings.count).to eq 4
      expect(following.name).to eq "julsfelic"
      expect(following.class).to eq Following
    end
  end
end


