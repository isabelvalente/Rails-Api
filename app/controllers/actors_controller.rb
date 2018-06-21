class ActorsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    actors = Actor.order('id ASC');
    render json: {status: 'SUCCESS', message: 'Loaded actors', data:actors},status: :ok
  end

  def show
    actor = Actor.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded actor', data:actor},status: :ok
  end

  def create
    actor = Actor.new(actor_params)

    if actor.save
      render json: {status: 'SUCCESS', message: 'Saved actor', data:actor},status: :ok
    else
      render json: {status: 'ERROR', message: 'Actor not saved', data:actor.errors},status: :unprocessable_entity
    end
  end

  def destroy
    actor = Actor.find(params[:id])
    actor.destroy
    render json: {status: 'SUCCESS', message: 'Deleted actor', data:actor},status: :ok
  end

  def update
    actor = Actor.find(params[:id])
    if actor.update_attributes(actor_params)
      render json: {status: 'SUCCESS', message: 'Updated actor', data:actor},status: :ok
    else
      render json: {status: 'ERROR', message: 'Actor not updated', data:actor.errors},status: :unprocessable_entity
    end
  end

  private

  def actor_params
    params.permit(:first_name, :last_name, :nickname, :age, :country_id)
  end

end
