require 'spec_helper'

describe 'Singning in' do
  it 'should have a field for email' do
    visit root_path
    page.has_field?('signin_email').should be_true
  end

  it 'should have a field for password' do
    visit root_path
    page.has_field?('signin_password').should be_true
  end

  it 'should have a sign in button' do
    visit root_path
    page.has_button?('Sign in').should be_true
  end

  context 'should be successful' do
    before(:each) do
      @user = create( :user )
      visit root_path
    end

    it 'should display a message' do
      fill_in( 'signin_email', with: @user.email )
      fill_in( 'signin_password', with: @user.password )
      click_button('Sign in')

      page.should have_content('Signed in Successfully')
    end

    it 'should display the name of the signed in account'
  end

  it 'should display a message indicating unsuccessful signin'

end
