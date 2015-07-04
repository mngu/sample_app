require 'rails_helper'

describe "users features" do

  describe "une inscription" do

    describe "ratée features" do

      it "ne devrait pas créer un nouvel utilisateur", :type => :feature do
        visit signup_path
        fill_in "user_nom",          :with => ""
        fill_in "user_email",        :with => ""
        fill_in "user_password",     :with => ""
        fill_in "user_password_confirmation", :with => ""
        click_button 'Inscription'
        expect(page).to have_css("#error_explanation")
      end
    end
  end
end