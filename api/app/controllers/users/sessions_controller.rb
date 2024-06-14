# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def new
    puts "============== sign_in_params"
    puts sign_in_params.inspect
    user = User.find_for_database_authentication(email: sign_in_params[:email])
    return invalid_login_attempt unless user

    if user.valid_password?(sign_in_params[:password])
      sign_in(user)
      render json: {
        status: { code: 200, message: 'User signed in successfully' },
        data: user.as_json(except: :jti)
      }, status: :ok
    else
      invalid_login_attempt
    end
  end


  private

  def invalid_login_attempt
    render json: { messages: ['Invalid Email or Password 1.'] }, status: :unprocessable_entity
  end

  def verify_signed_out_user
    current_user
    super
  end


  def respond_to_on_destroy
    head :no_content
  end

  def respond_with(resource, _opts = {})
    if resource
      # current_user is logged in successfully
      render json: {
        # user: current_user
        status: {code: 200, message: "User signed in successfully",
        data: current_user.as_json(except: :jti)}
      }, status: :ok
    else
      # current_user is not logged in successfully
      render json: {
        messages: ["Invalid Email or Password 2."],
      }, status: :unprocessable_entity
    end
  end


end
