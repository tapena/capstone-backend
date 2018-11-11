class Api::MoodsController < ApplicationController
before_action :authenticate_user, except: [:index, :show]

  def index
    # if current_user
    @moods = Mood.all
    # if family_id
    #   family_id = Mood.find_by(name: user_name)
    #   @moods = family.mood.where(user_name: current_user.id)
    # end 
      render 'index.json.jbuilder'
    # else
    #   render json: []
    # end
  end

  def create
    @mood = Mood.new(
                    user_id: current_user.name,
                    # family_id: current_user.family_id,
                    emotion: params[:emotion],
                    message: params[:message]
                    )
    if @mood.save
      render json: {message: 'Mood entered successfully'}, status: :created
    else
      render json: {errors: @mood.errors.full_messages}, status: :bad_request
    end
  end 

  def show
    @moods.all
    render "show.json.jbuilder"
  end

  def update
    @mood = Mood.find(params[:created_at])    
    @mood.emotion = params[:emotion] || @mood.emotion
    @mood.message = params[:message] || @mood.message
    if @mood.save
      render json: {message: 'successfully updated'}, status: :created
    else
      render json: {errors: @mood.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    @mood = Mood.find(params[:created_at])
    @mood.destroy
    render json: {message: "successfully destroyed"}
  end   
  
end
