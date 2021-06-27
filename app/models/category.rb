class Category < ApplicationRecord
	has_many :plaint_categories, dependent: :destroy
	has_many :plaints, through: :plaint_categories
end
