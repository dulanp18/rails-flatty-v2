class Tenant < ApplicationRecord
  validates :tenant_agreement_type, presence: true, inclusion: { in: %w(flatmate lease) }
  validates :head_tenant, inclusion: { in: [ true, false ] }
  validates :user_id, uniqueness: true

  belongs_to :flat
  belongs_to :user
end
