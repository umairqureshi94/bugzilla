class BugPolicy < ApplicationPolicy

	def new?
		user.qa? || user.user?
	end

	def create?
		user.qa? || user.user?
	end
	
	def show?
		user.manager? || user.qa? || user.user? || user.dev?
	end

	def assign?
		user.present? && user.dev?
	end

	def resolved?
		user.present? && user.dev?
	end

end
