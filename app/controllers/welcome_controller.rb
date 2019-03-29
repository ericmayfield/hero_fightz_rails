class WelcomeController < ApplicationController
    def home
        @heros = Hero.all
    end
end
