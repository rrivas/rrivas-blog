require 'spec_helper'

describe Post do
  context 'title' do
    it 'should not be allowed to have duplicates' do
      post = create( :post )
      build( :post, title: post.title ).should_not be_valid
    end

    it 'should be required' do
      build( :post, title: '' ).should_not be_valid
    end
    
    it 'should required with at least 5 characters' do
      build( :post, title: 'ABCD').should_not be_valid
    end
  end

  context 'content' do
    it 'should be required' do
      build( :post, content: '' ).should_not be_valid
    end
  end

  context 'authors' do
    it 'should be required' do
      build( :post, author: nil ).should_not be_valid
    end
  end
end
