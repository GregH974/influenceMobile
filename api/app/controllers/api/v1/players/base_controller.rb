 class Api::V1::Players::BaseController < ApplicationController
  # Use prepend to prevent conflict with before_action in controller in the future
  prepend_before_action :authenticate_user!
end

