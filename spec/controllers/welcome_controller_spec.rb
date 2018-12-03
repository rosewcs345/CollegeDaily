require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #login_page" do
    it "returns http success" do
      get :login_page
      expect(response).to have_http_status(:success)
    end
  end

end
