class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]

  def index
    @properties = Property.all
  end

  def show
    @properties = Property.where(category: params[:category])
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)

    if @property.save
      redirect_to properties_index_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @property.update(property_params)
    redirect_to properties_index_path
  end

  def destroy
    @property.destroy
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :location, :photo, :rating, :category, :price, :available, :user)
  end
end
