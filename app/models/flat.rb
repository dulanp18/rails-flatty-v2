class Flat < ApplicationRecord
  validates :street_address, presence: true
  validates :suburb, presence: true
  validates :post_code, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :max_tenants_nums, presence: true
  validates :current_tenants_num, presence: true
  validates_numericality_of :current_tenants_num, :less_than_or_equal_to => :max_tenants_nums
  validates :lease_start_date, presence: true
  validates :length_of_lease, presence: true

  has_many :tenants
  has_many :users, through: :tenants
end
