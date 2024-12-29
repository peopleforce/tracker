module Api
  class BaseController < ActionController::Base
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!

    respond_to :json
  end
end 