class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bug_users, dependent: :destroy
  has_many :bugs, through: :bug_users
  
  has_many :project_users , dependent: :destroy
  has_many :projects, through: :project_users

  enum role: {manager: 0, dev: 1, qa: 2, user: 3}

  after_initialize do 
  	if self.new_record?
  		self.role ||= :user
        end
          
  end

end