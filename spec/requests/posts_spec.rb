require 'spec_helper'

describe "Posts" do 
  describe "Get /posts" do
    it "displays posts" do
      post = create( :post )
      visit posts_path
      page.should have_content(post.title)
    end

    it "takes you to post show page when clicking on post"
  end
end