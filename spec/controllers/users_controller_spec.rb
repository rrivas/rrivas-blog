# require 'spec_helper'

# describe UsersController do
#   context 'GET new' do
#     it 'assigns a new user to @user' do
#       get :new
#       assigns( :user ).attributes.should eq( User.new.attributes )
#     end
#   end

#   context 'Post create' do
#     before(:each) do
#       @user = build( :user )
#       @user_attributes = { email: @user.email, 
#                            first_name: @user.first_name, 
#                            last_name: @user.last_name,
#                            password: @user.password,
#                            password_confirmation: @user.password,
#                            active: @user.active }
#     end

#     describe 'with valid params' do
#       it 'creates a new user' do
#         expect{
#           post :create, user: @user_attributes
#         }.to change(User, :count).by(1)
#       end

#       it 'assigns new user as @user' do
#         post :create, user: @user_attributes
#         assigns( :user ).should be_a( User )
#       end

#       it 'redirects to user show page on succesful save' do
#         post :create, user: @user_attributes
#         response.should redirect_to( root_url )
#       end
#     end

#     describe 'with invalid params' do
#       it 'should build a new user as @user' do
#         post :create, user: {}
#         assigns( :user ).should be_a_new( User )
#       end

#       it 'redirects to user new page on unsuccesful save' do
#         post :create, user: {}
#         response.should render_template( :new )
#       end
#     end
#   end
# end
