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

  context 'should be successful with good credentials' do
    before(:each) do
      @user = create( :user )
      visit root_path
      fill_in( 'signin_email', with: @user.email )
      fill_in( 'signin_password', with: @user.password )
      click_button('Sign in')
    end

    it 'should redirect to the root_path' do
      page.current_path.should eq(root_path)
    end

    it 'should display a message' do
      page.should have_content('Signed in Successfully')
    end

    it 'should display the name of the signed in account'
  end

  context 'should be unsuccessful with bad credentials' do
    before(:each) do
      @user = create( :user )
      visit root_path
      fill_in( 'signin_email', with: @user.email )
      fill_in( 'signin_password', with: 'SOMEPASSWORD' )
      click_button('Sign in')
    end

    it 'should display a message indicating unsuccessful signin' do
      page.should have_content('Invalid email or password')
    end

    it 'should render the new template' do
      page.current_path.should eq(sessions_path)
    end

    it 'should display the email address in the email field' do
      find_field('email').value.should eq( @user.email )
    end

    it 'should submit the secondary form if the information is correct' do
      fill_in( 'email', with: @user.email )
      fill_in( 'password', with: @user.password )
      click_button('signin')

      page.should have_content('Signed in Successfully')
    end
  end

end
