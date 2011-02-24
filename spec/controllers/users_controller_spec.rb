require 'spec_helper'

describe UsersController do
  render_views

  Factory.define :user do |user|
    user.name                   "Michael Hartl"
    user.email                  "mhartl@example.com"
    user.password               "foobar"
    user.password_confirmation  "foobar"
  end

  describe "GET 'show'" do
    
    before(:each) do
      @user = Factory(:user)
    end
        
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
  
  end

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end
    
    # Have_selector does not require an exact match 
    it "should have the right title" do
      get :new
      response.should have_selector('title', :content => "Sign up")
    end
  end

end
