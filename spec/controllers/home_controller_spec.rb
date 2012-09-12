require 'spec_helper'

describe HomeController do
  describe 'Get Index' do
    it 'should exists' do
      get :index
      response.response_code.should eq(200)
    end

    it 'assigns 5 posts to @post' do
      create_list(:post, 10)
      get :index
      assigns( :posts ).count.should eq(5)
    end
  end
end
