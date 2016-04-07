require 'rails_helper'

describe 'GithubService' do

  context 'repo' do
    it 'returns repos' do
      VCR.use_cassette 'GithubService#repos' do
        service = GithubService.new(current_user)
        repos = service.repos
        repo = repos.first
        expect(repos.count).to eq 30
        expect(repo[:name]).to eq "americas_funnies_home_gifs"
      end
    end
  end

  context 'following' do
    it 'returns followings' do
      VCR.use_cassette 'GithubService#followings' do
        service = GithubService.new(current_user)
        followings = service.following
        following = followings.first
        expect(followings.count).to eq 4
        expect(following[:login]).to eq 'julsfelic'
      end
    end
  end

  context 'followers' do
    it 'returns followers' do
      VCR.use_cassette 'GithubService#followers' do
        service = GithubService.new(current_user)
        followers = service.followers
        follower = followers.first
        expect(followers.count).to eq 6
        expect(follower[:login]).to eq 'MDes41'
      end
    end
  end

  context 'organizations' do
    it 'returns collection of organizations' do
      VCR.use_cassette 'GithubService#organizations' do
        service = GithubService.new(current_user)
        organizations = service.organizations
        organization = organizations.first
        expect(organizations.count).to eq 1
        expect(organization[:login]).to eq 'TestingTuringTesting'
      end
    end
  end
end
