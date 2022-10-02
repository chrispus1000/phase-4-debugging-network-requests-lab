class ToysController < ApplicationController
  wrap_parameters format: []
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record_warning

  def index
    toys = Toy.all
    render json: toys
  end

  def show 
    toy = Toy.find_by(id: params[:id])
    render json: toy, status: :ok
  end 

  def create
    toy = Toy.create!(toy_params)
    render json: toy, status: :created
  end

  def update
    toy = Toy.find_by(id: params[:id])
    toy.update(toy_params)
    render json: toy, status: :accepted
  end

  def destroy
    toy = Toy.find_by(id: params[:id])
    toy.destroy
    head :no_content
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

  def render_invalid_record_warning(invalid)
    render json: {errors: invalid.record.errors}
  end 

end