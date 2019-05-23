class Property < ApplicationRecord
  serialize :availability, Array
  include PgSearch
  pg_search_scope :search_by_category,
  against: [:category],
    using: {
      tsearch: { prefix: true }
    }
  belongs_to :user
  has_many :bookings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
