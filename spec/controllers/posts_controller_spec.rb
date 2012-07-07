require 'spec_helper'

describe PostsController do
  describe "Get Index" do
    it "assigns all posts to @posts" do
      post = create(:post)
      get :index
      assigns( :posts ).should eq([post])
    end
  end

  describe "Show Post" do
    it "should assign the correct post to @post" do
      post = create(:post)
      get :show, id: post.id
      assigns( :post ).should eq(post)
    end
  end
end
