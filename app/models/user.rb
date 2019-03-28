class User < ApplicationRecord
    has_many :heros, dependent: :destroy
    has_many :teams, through: :heros
    has_secure_password
end
