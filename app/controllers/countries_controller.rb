class CountriesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    countries = Country.order('id ASC');
    render json: {status: 'SUCCESS', message: 'Loaded countries', data:countries},status: :ok
  end

  def show
    country = Country.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded country', data:country},status: :ok
  end

  def create
    country = Country.new(country_params)

    if country.save
      render json: {status: 'SUCCESS', message: 'Saved country', data:country},status: :ok
    else
      render json: {status: 'ERROR', message: 'Country not saved', data:country.errors},status: :unprocessable_entity
    end
  end

  def destroy
    country = Country.find(params[:id])
    country.destroy
    render json: {status: 'SUCCESS', message: 'Deleted country', data:country},status: :ok
  end

  def update
    country = Country.find(params[:id])
    if country.update_attributes(country_params)
      render json: {status: 'SUCCESS', message: 'Updated country', data:country},status: :ok
    else
      render json: {status: 'ERROR', message: 'Country not updated', data:country.errors},status: :unprocessable_entity
    end
  end

  private

  def country_params
    params.permit(:country_name, :continent, :population, :language, :world_cup)
  end
end
