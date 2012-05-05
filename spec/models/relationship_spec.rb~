require 'spec_helper'

describe Relationship do

  before(:each) do
    @follower = Factory(:user)
    @followed = Factory(:user, :email => Factory.next(:email))

    @relationship = @follower.relationships.build(:followed_id => @followed.id)
  end

  it "should create a new instance given valid attributes" do
    @relationship.save!
  end

		describe "follow methods" do

    			before(:each) do
      			@relationship.save
    			end

    			it "should have a follower attribute" do
      			@relationship.should respond_to(:follower)
    			end

    			it "should have the right follower" do
      			@relationship.follower.should == @follower
    			end

    			it "should have a followed attribute" do
      			@relationship.should respond_to(:followed)
    			end

    			it "should have the right followed user" do
      			@relationship.followed.should == @followed
    			end
  		end

		describe "validations" do

    			it "should require a follower_id" do
      			@relationship.follower_id = nil
      			@relationship.should_not be_valid
    			end

    			it "should require a followed_id" do
      			@relationship.followed_id = nil
      			@relationship.should_not be_valid
    			end
  		end

	#Exercise 1
		describe "relationship associations" do
    			
			let(:other_user) { FactoryGirl.create(:user) }
    			before do
      			@user.save
      			@user.follow!(other_user)
      			other_user.follow!(@user)
    			end

    			it "should destroy associated relationships" do
      			relationships = @user.relationships
      			@user.destroy
      			relationships.should be_empty
    			end

    			it "should destroy associated reverse relationships" do
      			reverse_relationships = @user.reverse_relationships
      			@user.destroy
      			reverse_relationships.should be_empty
    			end
  		end
	#End Exercise 1



end
