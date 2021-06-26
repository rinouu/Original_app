class Plaint < ApplicationRecord
	validates :title, presence: true
	validates :description, presence: true
	max_paginates_per 5
end
