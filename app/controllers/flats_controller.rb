class FlatsController < ApplicationController
  before_action :select_flat, only: [:show, :update, :edit, :destroy]
  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @flat.update(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.define(:flat).require(:name, :description, :address, :price_per_night, :number_of_guests)
  end

  def select_flat
    @flat = Flat.find(params[:id])
  end
end
