class WelcomeController < ApplicationController
    def home
        @heros = Hero.last_five_heros
    end
end
