class RecommendHistory < ApplicationRecord
   belongs_to :chair, optional: true
   #relation recommend history
   belongs_to :user
end
