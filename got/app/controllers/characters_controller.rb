class CharactersController < ApplicationController



    def show
      @house = House.find(params[:house_id])
      @character = @house.characters.find(params[:id])
    end

    def new
      @house = House.find(params[:house_id])
      @character = @house.characters.new
    end

    def create
      @house = House.find(params[:house_id])
      @character = @house.characters.create(character_params.merge(user: current_user))
      redirect_to house_path(@house)
    end

    def edit
      @house = House.find(params[:house_id])
      @character = Character.find(params[:id])
    end

    def update
      @house = House.find(params[:house_id])
      @character = @house.characters.find(params[:id])
      if @character.user == current_user
        @character.update(character_params)
      else
        flash[:alert] = "Only the creator can edit #{@character.name}."
      end
      redirect_to house_path(@house)
    end

    def destroy
      @house = House.find(params[:house_id])
      @character = @house.characters.find(params[:id])
      if @character.user == current_user
        @character.destroy
      else
        flash[:alert] = "Only the creator can get rid of #{character.name}."
      end
      redirect_to house_path(@house)
    end

    private
  def character_params
    params.require(:character).permit(:name, :photo_url, :bio)
  end

end
