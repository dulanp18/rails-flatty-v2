class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :tenant

  def country_name
    country = ISO3166::Country[nationality]
    country.translations[I18n.locale.to_s] || country.name
  end
end
