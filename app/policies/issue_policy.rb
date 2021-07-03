class IssuePolicy < ApplicationPolicy
	def index?
		true
	end

	def show?
		user.with_role?('super_admin')
	end

	def create?
		user.with_role?('super_admin')
	end

	def update?
		user == issue.user
	end

	def destroy?
		user.admin? || user == issue.user

	end

	private

	def issue
		record
	end
end