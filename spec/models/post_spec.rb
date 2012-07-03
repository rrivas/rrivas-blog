require 'spec_helper'

describe Post do
  context 'title' do
    it 'should not allow multiple posts with the same title'
    it 'should require a title'
    it 'should require titles with at least 5 characters'
  end
end
