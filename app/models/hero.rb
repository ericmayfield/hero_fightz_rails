class Hero < ApplicationRecord
  belongs_to :user
  belongs_to :team, optional: true
end
