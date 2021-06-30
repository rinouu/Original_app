class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  	validates :name,  presence: true, length: { maximum: 30 }
  	has_many :plaints, dependent: :destroy
 	has_many :punctualities, dependent: :destroy
 	scope :admin_search, -> {find_by(admin: true)}
	def admin_search
	  find_by(admin: true)
	end
end
