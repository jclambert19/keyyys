class Subscription < ActiveRecord::Base
  belongs_to :user
  has_many :bunches, dependent: :destroy

  accepts_nested_attributes_for :bunches, :allow_destroy => true
end
