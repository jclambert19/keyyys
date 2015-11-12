class Bunch < ActiveRecord::Base
  belongs_to :user
  belongs_to :subscription
  has_many :missions, dependent: :destroy
end
