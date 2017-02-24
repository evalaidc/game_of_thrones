class HousesController < ApplicationController

  def index
    @houses = House.all
  end

  def new
    @house = House.new
  end

  def create
    @house = House.create!(house_params.merge(user: current_user))
    redirect_to house_path(@house)
  end

  def show
    @house = House.find(params[:id])
    @characters= @house.characters.all
  end

  def edit
    @house = House.find(params[:id])
  end

  def update
    @house = House.find(params[:id])
    if @house.user == current_user
      @house.update(house_params)
    else
      flash[:alert] = "Only the creator can edit #{@house.name}."
    end
    redirect_to house_path(@house)
  end

  def destroy
    @house = House.find(params[:id])
    if @house.user == current_user
      @house.destroy
    else
      flash[:alert] = "Only the creator can delete #{@house.name}."
    end
    redirect_to houses_path
  end

  private
  def house_params
    params.require(:house).permit(:name, :family_crest_url, :realm, :history)
  end
end
