class Game < ApplicationRecord
    belongs_to(:user)
    belongs_to(:trivia)
end