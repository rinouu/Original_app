class Plaint < ApplicationRecord
	validates :title, presence: true
	validates :description, presence: true
	max_paginates_per 5
	belongs_to :user
	scope :user_plaint_list, -> (query) {where(user_id: query)}
	def user_plaint_list(query)
	  where(user_id: query)
	end
	has_many :plaint_categories, dependent: :destroy
	has_many :categories, through: :plaint_categories
	scope :plaint_category_search, -> (query) {
		@ids = PlaintCategory.where(category_id: query).pluck(:plaint_id)
		where(id: @ids)}
end
