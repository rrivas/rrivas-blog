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
  end
  
  context 'Last Name' do
    it "should be at least 2 characters long" do
      build( :user, last_name: 'aa').should_not be_valid
    end

    it "should be alphabetic characters only" do
      build( :user, last_name: 'a32vd23' ).should_not be_valid
    end

    it "should be required" do
      build( :user, last_name: nil ).should_not be_valid
    end
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
    
    it "should require at least 1 digit"
    it "should be at least 8 characters long"
  end
end
