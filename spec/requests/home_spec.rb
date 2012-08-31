require 'spec_helper'

describe "Home" do
  describe "GET /home" do
    it 'should exists' do
      visit home_index_path
      current_path.should eq(home_index_path)
    end
  end
end
