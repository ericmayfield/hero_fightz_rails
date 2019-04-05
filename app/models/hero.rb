class Hero < ApplicationRecord
  belongs_to :user
  belongs_to :team, optional: true

  # Scope to load the last five heroes created
  def self.last_five_heros
    order(id: :desc).limit(5)
  end 

end
