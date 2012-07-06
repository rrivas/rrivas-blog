require 'spec_helper'

describe Post do
  context 'title' do
    it 'should not allow multiple posts with the same title' do
      post = create( :post )
      build( :post, title: post.title ).should_not be_valid
    end

    it 'should require a title' do
      build( :post, title: '' ).should_not be_valid
    end
    
    it 'should require titles with at least 5 characters' do
      build( :post, title: 'ABCD').should_not be_valid
    end
  end
end
