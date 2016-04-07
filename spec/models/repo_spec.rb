require 'rails_helper'

describe 'Repo' do
  context 'finds all repos' do
    it 'returns a collection of repos for a particular user' do
      VCR.use_cassette 'Repo.all()' do
        repos = Repo.all(current_user)
        repo = repos.first
        expect(repos.count).to eq 30
        expect(repo.name).to eq "americas_funnies_home_gifs"
        expect(repo.class).to eq Repo
      end
    end
  end
end
