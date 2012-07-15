require 'spec_helper'

describe UsersController do
  context 'GET new' do
    it 'assigns a new user to @user' do
      get :new
      assigns( :user ).attributes.should eq( User.new.attributes )
    end
  end
end
