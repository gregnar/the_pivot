class SupplierUser < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :user
end
