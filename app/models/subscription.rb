class Subscription < ActiveRecord::Base
  belongs_to :user
  has_many :bunches

  accepts_nested_attributes_for :bunches, :allow_destroy => true
end
