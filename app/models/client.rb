class Client < ApplicationRecord
    has_many :memberships
    has_many :gyms, through: :memberships
  
    def total_membership
      total = 0
      self.memberships.each do |membership|
        total += membership.charge
      end
  
      return total
    end
  end