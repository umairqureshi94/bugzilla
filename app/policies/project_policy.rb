class ProjectPolicy < ApplicationPolicy


	def index?
		 user.manager? || user.user? || user.qa? || user.dev?
	end

	def new?
		user.present? && user.manager?
	end

	def create?
		user.present? && user.manager?
	end

	def edit?
		user.present? && user.manager?
	end

	def update?
		user.present? && user.manager?
	end

	def show?
		user.manager? || user.user? || user.dev? || user.qa?
	end

	def destroy?
		user.present? && user.manager?
	end

	def users?
		user.present? && user.manager?
	end

	def add?
		user.present? && user.manager?	
	end

	def remove?
		user.present? && user.manager?
	end

end
