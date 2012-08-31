# require 'spec_helper'

# describe 'Users' do
#   context 'New User' do
#     before(:each) do
#       visit new_user_path
#     end

#     it "should have a page title of 'New User'" do
#       page.should have_css('.page-header h1.title', text: 'New User')
#     end

#     context "'sign up' button" do
#       it "should exists" do
#         page.has_button?('Sign Up').should be_true
#       end

#       context 'on submit' do
#         before(:each) do
#           @user = build( :user )
#         end

#         it "should post to user#create with valid attributes and display a flash notice" do
#           fill_in 'First name', with: @user.first_name
#           fill_in 'Last name', with: @user.last_name
#           fill_in 'Email', with: @user.email
#           fill_in 'Password', with: @user.password
#           fill_in 'Password confirmation', with: @user.password

#           page.find_button('Sign Up').click

#           page.should have_content('Thank you for signing up')
#         end
#       end
#     end

#     describe 'first name' do
#       it "should have a field" do
#         page.has_field?('First name').should be_true
#       end
#     end

#     describe 'last name' do
#       it "should have a field" do
#         page.has_field?('Last name').should be_true
#       end
#     end

#     describe 'eamil address' do
#       it 'should have a field' do
#         page.has_field?('Email').should be_true
#       end
#     end

#     describe 'password' do
#       it 'should have a field' do
#         page.has_field?('Password').should be_true
#       end

#       it 'should be required' do
#         page.find_field('Password')[:class].split(' ').include?('required').should be_true
#       end
#     end

#     describe 'password confirmation' do
#       it 'should have a field' do
#         page.has_field?('Password confirmation').should be_true
#       end

#       it 'should be required' do
#         page.find_field('Password confirmation')[:class].split(' ').include?('required').should be_true
#       end
#     end

#     describe 'active' do
#       it 'should have a field' do
#         page.has_field?('Active').should be_true
#       end

#       it 'should be checked by default' do
#         page.find_field('Active').checked?.should be_true
#       end
#     end
#   end
# end