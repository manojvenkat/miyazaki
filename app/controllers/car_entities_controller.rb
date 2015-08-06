class CarEntitiesController < ApplicationController
  respond_to :json

  def index
    @car_entities = CarEntity.all
    respond_to do |format|
      format.json { render json: @car_entities }
    end
  end

  def show
    @car_entity = CarEntity.find(params[:id])
    respond_to do |format|
      format.json { render json: @car_entity } 
    end
  end

  def create
    respond_to do |format|
      format.json { 
        CarEntity.create!(params[:car_entity])
        render text: CarEntity.last.to_json
      }
    end
  end

  def update
    @car_entity = CarEntity.find(params[:id])
    respond_to do |format|
      format.json { 
        @car_entity.update_attributes(params[:car_entity])
        render text: @car_entity.to_json
      }
    end
  end

  ##  
  def destroy
    @car_entity = CarEntity.find(params[:id])
    respond_to do |format|
      format.json {
        @car_entity.destroy
        render text: @car_entity.to_json
      }
    end
  end
end
