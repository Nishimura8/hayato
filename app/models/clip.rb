class Clip < ApplicationRecord
    belongs_to :user
    belongs_to :recommended
end
