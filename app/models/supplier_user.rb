class SupplierUser < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :user

  validates :user_id, uniqueness: true
end
