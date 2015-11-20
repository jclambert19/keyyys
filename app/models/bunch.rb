class Bunch < ActiveRecord::Base
  belongs_to :user
  belongs_to :subscription

  validates :name, presence: true
  validates :number_of_items, presence: true, numericality: { only_integer: true, greater_than: 0 }
  has_many :missions, dependent: :destroy
end
