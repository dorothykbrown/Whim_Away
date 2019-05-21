class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]

  def index
    @properties = policy_scope(Property).all
    # use javascript to filter all properties
  end

  def show
    # @properties = Property.where(category: params[:category
    @property = Property.find(params[:id])
    authorize @property
  end

  def new
    @property = Property.new
    authorize @property
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    authorize @property

    if @property.save
      redirect_to properties_index_path, notice: 'Property was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    authorize @property
    if @property.update(property_params)
      redirect_to properties_index_path, notice: 'Property was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @property
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
