class CarModelsController < ApplicationController
  respond_to :json

  def index
    @car_models = CarModel.all
    respond_to do |format|
      format.json { render json: @car_models }
    end
  end

  def show
    @car_model = CarModel.find(params[:id])
    respond_to do |format|
      format.json { render json: @car_model } 
    end
  end

  def create
    respond_to do |format|
      format.json { 
        CarModel.create!(params[:car_model])
        render text: CarModel.last.to_json
      }
    end
  end

  def update
    @car_model = CarModel.find(params[:id])
    respond_to do |format|
      format.json { 
        @car_model.update_attributes(params[:car_model])
        render text: @car_model.to_json
      }
    end
  end

  ##  
  def destroy
    @car_model = CarModel.find(params[:id])
    respond_to do |format|
      format.json {
        @car_model.destroy
        render text: @car_model.to_json
      }
    end
  end
end
