class Plaint < ApplicationRecord
	validates :title, presence: true
	validates :description, presence: true
	max_paginates_per 5
	belongs_to :user
	scope :user_plaint_list, -> (query) {where(user_id: query)}
	def user_plaint_list(query)
	  where(user_id: query)
	end
end
