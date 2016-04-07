require 'rails_helper'

describe 'Organization' do
  it 'returns collection of user organizations' do
    VCR.use_cassette 'Organization.all()' do
      organizations = Organization.all(current_user)
      organization = organizations.first
      expect(organizations.count).to eq 1
      expect(organization.name).to eq 'TestingTuringTesting'
      expect(organization.class).to eq Organization
    end
  end
end
