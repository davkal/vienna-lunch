class Restaurant < ActiveRecord::Base
  validates :name, presence: true
end
