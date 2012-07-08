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
      build( :user, last_name: '' ).should_not be_valid
    end
  end

  context 'Email' do
    it "should be required" do
      build( :user, email: '' ).should_not be_valid
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
    it "should create a salt" do
      user = create( :user )
      user.password_salt.should_not be_blank
    end

    it "should create a hash" do
      user = create( :user )
      user.password_hash.should_not be_blank
    end
  end
end
