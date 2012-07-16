require 'spec_helper'

describe UsersController do
  context 'GET new' do
    it 'assigns a new user to @user' do
      get :new
      assigns( :user ).attributes.should eq( User.new.attributes )
    end
  end

  context 'Post create' do
    before(:each) do
      @user = build( :user )
      @user_attributes = { email: @user.email, 
                           first_name: @user.first_name, 
                           last_name: @user.last_name,
                           password: @user.password,
                           password_confirmation: @user.password,
                           active: @user.active }
    end

    it 'builds a user and saves it' do
      post :create, user: @user_attributes
      assigns( :user ).new_record?.should be_false
    end

    it 'redirects to user show page on succesful save'
    it 'redirects to user new page on unsuccesful save' do
      post :create, user: @user_attributes.merge( password: nil )
      response.should render_template( :new )
    end
  end
end
