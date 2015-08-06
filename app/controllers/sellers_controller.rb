class SellersController < ApplicationController
  respond_to :json

  def index
    @sellers = Seller.all
    respond_to do |format|
      format.json { render json: @sellers }
    end
  end

  def show
    @seller = Seller.find(params[:id])
    respond_to do |format|
      format.json { render json: @seller } 
    end
  end

  def create
    respond_to do |format|
      format.json { 
        Seller.create!(params[:seller])
        render text: Seller.last.to_json
      }
    end
  end

  def update
    @seller = Seller.find(params[:id])
    respond_to do |format|
      format.json { 
        @seller.update_attributes(params[:seller])
        render text: @seller.to_json
      }
    end
  end

  def destroy
    @seller = Seller.find(params[:id])
    respond_to do |format|
      format.json {
        @seller.destroy
        render text: @seller.to_json
      }
    end
  end
end
