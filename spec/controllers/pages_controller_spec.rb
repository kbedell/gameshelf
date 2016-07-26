require 'rails_helper'

describe PagesController do
  describe "GET show" do
    subject { get :show, page: 'privacy' }

    it "renders the privacy policy" do
      expect(subject).to render_template("pages/privacy")
    end
  end
end
