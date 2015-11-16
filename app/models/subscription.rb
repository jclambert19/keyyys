class Subscription < ActiveRecord::Base
  belongs_to :user
  has_many :bunches, dependent: :destroy
  monetize :price_cents

  accepts_nested_attributes_for :bunches, :allow_destroy => true

  def full_address
    "#{street}, #{postcode} #{city}"
  end
end
