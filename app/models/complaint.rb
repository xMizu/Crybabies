class Complaint < ApplicationRecord
    belongs_to :user
    belongs_to :round 
end
