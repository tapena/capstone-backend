class Api::SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
        jwt = JWT.encode(
        {
        user_id: user.id, # the data to encode
        exp: 24.hours.from_now.to_i # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        'HS256' # the encryption algorithm
        )
        render json: {jwt: jwt, family_id: user.family_id, user_id: user.id, user_name: user.name}, status: :created
    else
        # render json: {errors: user.errors.full_messages}, status: :bad_request
        render json: {}, status: :unauthorized
    end
  end
end
