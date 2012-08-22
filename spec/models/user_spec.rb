require 'spec_helper'

describe User do
  context 'First Name' do
    it "should be at least 2 characters long" do
      build( :user, first_name: 'a' ).should_not be_valid
    end

    it "should be letters only" do
      build( :user, first_name: 'aasdf3243').should_not be_valid
    end

    it "should be required" do
      build( :user, first_name: '' ).should_not be_valid
    end

    it "should not allow special characters"
  end
  
  context 'Last Name' do
    it "should be at least 2 characters long" do
      build( :user, last_name: 'a').should_not be_valid
    end

    it "should be alphabetic characters only" do
      build( :user, last_name: 'a32vd23' ).should_not be_valid
    end

    it "should be required" do
      build( :user, last_name: nil ).should_not be_valid
    end

    it "should not allow special characters"
  end

  context 'Email' do
    it "should be required" do
      build( :user, email: nil ).should_not be_valid
    end

    it "should be unique" do
      user = create( :user )
      build( :user, email: user.email ).should_not be_valid
    end

    it "should be case insensitive" do
      user = create( :user )
      build( :user, email: user.email.upcase ).should_not be_valid
    end
  end

  context 'Password' do
    it "should be required" do
      build( :user, password: nil ).should_not be_valid
    end

    it "should require at least 1 digit" do
      build( :user, password: 'abcdefgh' ).should_not be_valid
    end

    it "should be at least 8 characters long" do
      build( :user, password: 'abcdef1').should_not be_valid
    end
  end

  context 'Active' do
    it "should be required" do
      build( :user, active: nil ).should_not be_valid
    end
  end

  context 'Full Name' do
    it 'should return first and last name combined' do
      user = create( :user )
      user.full_name.should eq("#{user.first_name} #{user.last_name}")
    end
  end
end
