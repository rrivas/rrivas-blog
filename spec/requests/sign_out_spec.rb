require 'spec_helper'

describe "Sign out" do
  describe 'going to sign out path' do
    before(:each) do
      sign_user_in
      visit sign_out_path
    end

    it 'should redirect you to root path' do
      page.current_path.should eq(root_path)
    end

    it 'should have a notice' do
      page.should have_content('Signed out Successfully')
    end

    it 'should have the sign in form' do
      page.should have_selector('form.navbar-form')
    end
  end
end
