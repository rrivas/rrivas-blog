require 'spec_helper'

describe HomeController do
  describe 'Get Index' do
    it 'should exists' do
      get :index
      response.response_code.should eq(200)
    end
  end
end
