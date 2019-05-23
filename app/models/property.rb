class Property < ApplicationRecord
  belongs_to :user
  has_many :bookings

  serialize :availability, Array
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
  pg_search_scope :search_by_category_and_name,
    against: [:category, :name],
    using: {
      tsearch: { prefix: true }
    }
end
