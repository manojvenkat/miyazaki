class InspectionsController < ApplicationController
  respond_to :json

  def index
    @inspections = Inspection.all
    respond_to do |format|
      format.json { render json: @inspections }
    end
  end

  def show
    @inspection = Inspection.find(params[:id])
    respond_to do |format|
      format.json { render json: @inspection } 
    end
  end

  def create
    parse_date_time(params)
    respond_to do |format|
      format.json {
        Inspection.create!(params[:inspection])
        render text: Inspection.last.to_json
      }
    end
  end

  def update
    byebug
    parse_date_time(params)
    @inspection = Inspection.find(params[:id])
    respond_to do |format|
      format.json { 
        @inspection.update_attributes(params[:inspection])
        render text: @inspection.to_json
      }
    end
  end

  def destroy
    @inspection = Inspection.find(params[:id])
    respond_to do |format|
      format.json {
        @inspection.destroy
        render text: @inspection.to_json
      }
    end
  end

  private
    def parse_date_time(params)
      params[:inspection][:time] = DateTime.parse(params[:inspection][:time])
      params
    end
end
