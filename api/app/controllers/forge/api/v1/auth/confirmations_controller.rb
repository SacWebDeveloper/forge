module Forge
  module Api
    module V1
      class Auth::ConfirmationsController < DeviseTokenAuth::ConfirmationsController
        skip_after_action :verify_authorized
      end
    end
  end
end
