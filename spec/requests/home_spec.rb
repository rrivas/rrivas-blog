require 'spec_helper'

describe "Home" do
  describe "GET /home" do
    it 'should exists' do
      visit home_index_path
      current_path.should eq(home_index_path)
    end

    context 'should have posts' do
      before(:each) do
        @post = create(:post)
        visit home_index_path
      end

      it 'with title' do
        page.should have_content(@post.title)
      end

      it 'should have post author' do
        page.should have_content(@post.author)
      end

      it 'should have post content' do
        page.should have_content(@post.content)
      end
    end
  end
end
