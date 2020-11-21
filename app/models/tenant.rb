class Tenant < ApplicationRecord
  validates :tenant_agreement_type, presence: true, inclusion: { in: %w(flatmate lease) }
  validates :head_tenant, inclusion: { in: [ true, false ] }

  belongs_to :flat
  belongs_to :user
end
