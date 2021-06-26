class Punctuality < ApplicationRecord
	validates :arrival_time, presence: true
	validates :departure_time, presence: true
	belongs_to :user
	scope :user_punctuality_list, -> (query) {where(user_id: query)}
	def user_punctuality_list(query)
	  where(user_id: query)
	end
end