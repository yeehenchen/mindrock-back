class TeamUser < ApplicationRecord
  belongs_to :users
  belongs_to :teams
end
