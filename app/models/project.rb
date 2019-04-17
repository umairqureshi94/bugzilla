class Project < ApplicationRecord
	
	
	has_many :bugs, dependent: :destroy

	has_many :project_users, dependent: :destroy
	has_many :users, through: :project_users

	validates :title, presence: true

end
