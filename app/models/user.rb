class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :name, presence: true


  has_many :bug_users, dependent: :destroy
  has_many :bugs, through: :bug_users
  
  has_many :project_users , dependent: :destroy
  has_many :projects, through: :project_users

  enum role: {manager: 0, dev: 1, qa: 2, user: 3}


  def manager?
    role == "manager"
  end

  def dev?
    role == "dev"
  end

  def qa?
    role == "qa"
  end

  def user?
    role == "user"
  end


  after_initialize do 
  	if self.new_record?
  		self.role ||= :user
        end
          
  end

end