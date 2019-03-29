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
end
