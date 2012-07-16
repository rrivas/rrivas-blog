require 'spec_helper'

describe 'Users' do
  context 'New User' do
    before(:each) do
      visit new_user_path
    end

    it "should have a page title of 'New User'" do
      page.should have_css('.page-header h1.title', text: 'New User')
    end

    context "'sign up' button" do
      it "should exists" do
        page.has_button?('Sign Up').should be_true
      end

      it "should post to user#create with valid attributes"
    end

    describe 'first name' do
      it "should have a field" do
        page.has_field?('First name').should be_true
      end
    end

    describe 'last name' do
      it "should have a field" do
        page.has_field?('Last name').should be_true
      end
    end

    describe 'eamil address' do
      it 'should have a field' do
        page.has_field?('Email').should be_true
      end
    end

    describe 'password' do
      it 'should have a field' do
        page.has_field?('Password').should be_true
      end

      it 'should be required' do
        page.find_field('Password')[:class].split(' ').include?('required').should be_true
      end
    end

    describe 'password confirmation' do
      it 'should have a field' do
        page.has_field?('Password confirmation').should be_true
      end

      it 'should be required' do
        page.find_field('Password confirmation')[:class].split(' ').include?('required').should be_true
      end
    end

    describe 'active' do
      it 'should have a field' do
        page.has_field?('Active').should be_true
      end

      it 'should be checked by default' do
        page.find_field('Active').checked?.should be_true
      end
    end
  end
end