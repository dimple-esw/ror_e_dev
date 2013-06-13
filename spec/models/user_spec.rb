require 'spec_helper'

describe User do

  it { should have_many(:tweets) }
  it { should have_many(:user_profiles) }


describe SessionsController do
   before(:each) do
     request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] 

  end

  describe 'POST create' do

  it "should find the Authentication using the uid and provider from omniauth" do
    User.should_receive(:find_by_provider_and_uid)
    post 'auth/twitter/callback'
  end
end

end
end
