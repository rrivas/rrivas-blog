require 'spec_helper'

describe SessionsController do
  before(:each) do
    @user = create( :user )
  end

  context 'Post Create' do
    describe 'success' do
      it 'should store the user id in session' do
        post :create, user: { email: @user.email, password: @user.password }
        controller.session[:user_id].should_not be_blank
      end
    end

    describe 'failure' do
      it 'should have the session variable blank' do
        post :create, user: { email: @user.email, password: 'NOTTHIS' }
        controller.session[:user_id].should be_blank
      end
    end

  end

  context 'DELETE Destroy' do

  end
end
