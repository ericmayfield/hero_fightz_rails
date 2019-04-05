class HerosController < ApplicationController
    before_action :load_hero, only: [:show, :edit, :update, :destroy]
    before_action :is_user, except: [:index, :show]
    #before_action :is_user_or_on_team, only: [:index, :show]

    def index
        @heros = current_user.heros
    end

    def show
    end

    def new
        if params[:user_id]
            @hero = Hero.new(user_id: params[:user_id])
        else
            @hero = Hero.new
        end
    end

    def create
        @hero = Hero.new(hero_params)

        if @hero.save
            render :show
        else
            render :new
        end
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

    #Checks if current user logged in matches user record trying to view
    def is_user
        if params[:user_id] != current_user.id
            flash[:alert] = "You don't have access to view this content."
            redirect_to account_path(current_user)
        end
    end
end
