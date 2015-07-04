require 'rails_helper'

describe "users features" do

  before(:each) do
    @user = create(:user)
  end

  it "right title" do
    visit new_user_path
    expect(page).to have_selector("h1", :text => "new")
  end

  it "should have a h1 with the name of the user" do
    visit user_path(:id => @user)
    expect(page).to have_selector('h1', :text => @user.nom)
  end

end