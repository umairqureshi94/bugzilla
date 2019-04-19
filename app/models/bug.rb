class Bug < ApplicationRecord
	
	belongs_to :project

	has_many :bug_users, dependent: :destroy
	has_many :users, through: :bug_users
	
	validates :title, presence: :true, uniqueness: true
	validate :deadline_should_not_be_in_past
	
	mount_uploader :image, ImageUploader

	def deadline_should_not_be_in_past
		if deadline.present? && deadline < Date.today
			errors.add(:deadline, 'Date Cannot be in past')
		end
	end

	def resolve_bug
		# Use enums with state machine incase types and status options increase
		if self.b_type == 'BUG'
	        self.status = 'RESOLVED'
	    else
	        self.status = 'COMPLETED'
	    end
	    self.save!
	end

end
