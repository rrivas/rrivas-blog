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

      it 'should render new template' do
        post :create, user: { email: @user.email, password: 'NOTTHIS' }
        response.should render_template('new')
      end
    end

  end

  context 'DELETE Destroy' do
    it 'should delete the session user id' do
      sign_user_in
      delete :destroy
      controller.session[:user_id].should be_blank
    end
  end
end
