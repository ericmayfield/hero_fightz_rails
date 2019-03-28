class Team < ApplicationRecord
    has_many :heros
    has_many :users, through: :heros
    # before_save :method

    # def method
    #     user = User.find_by(id: session[:user_id])
end
