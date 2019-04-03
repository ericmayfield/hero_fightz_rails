class HerosController < ApplicationController
    before_action :load_hero, only:[:show, :edit, :update, :destroy]
    before_action :is_user

    def index
        @heros = current_user.heros
    end

    def show
    end

    def new
        @hero = Hero.new
    end

    def create
        @hero = Hero.create(hero_params)
        render :show
    end

    def edit
    end

    def update
        @hero.new(hero_params)
        @hero.save
        render :show
    end

    def destroy
        @hero.delete
        redirect_to account_path(current_user)
    end

    private

    def hero_params
        params.require(:hero).permit(:name, :battle_cry, :bio, :img_path, :user_id)
    end

    def load_hero
        @hero = Hero.find_by(id: params[:id])
    end
end
