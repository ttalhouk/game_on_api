class Player < ActiveRecord::Base
  has_many :rsvps, dependent: :destroy
  has_many :players_teams, dependent: :destroy
  has_many :teams, through: :players_teams, dependent: :destroy
  has_many :home_games, through: :teams
  has_many :away_games, through: :teams

  has_secure_password

  validates :name, :email, :zip_code, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

end
