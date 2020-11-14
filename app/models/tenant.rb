class Tenant < ApplicationRecord
  validates :tenant_agreement_type, presence: true, inclusion: { in: %w(flatmate lease) }
  validates :head_tenant, presence: true

  belongs_to :flat
  belongs_to :user
end
