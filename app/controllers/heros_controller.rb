class HerosController < ApplicationController
    def new
        @hero = Hero.new
    end

    def create
        @hero = Hero.create(hero_params)
        render :show
    end

    def show
        @hero = Hero.find_by(id: params[:id])
    end

    private

    def user_params
        params.require(:hero).permit(:name, :battle_cry, :bio, :img_path, :user_id)
    end
end
