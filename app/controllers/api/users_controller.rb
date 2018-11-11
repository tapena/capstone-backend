class Api::UsersController < ApplicationController  
  
  def create
    if params[:new_family] == "true"
      family = Family.create
      user = {
              name: params[:name],
              family_id: family.id,
              password: params[:password],
              password_confirmation: params[:password_confirmation]
              }
    else
      user = {
              name: params[:name],
              family_id: params[:family_id],
              password: params[:password],
              password_confirmation: params[:password_confirmation]
              }
    end
    user = User.new(user_info)
    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

end
