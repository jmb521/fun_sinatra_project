class Card < ActiveRecord::Base
    belongs_to :user
    validates :team, presence: true
end
