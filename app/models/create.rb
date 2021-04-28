class Create < ApplicationRecord
  validates :title, presence: true, length: { minumum: 2, maximum: 100 }
  validates :description, presence: true, length: { minumum: 2, maximum: 999 }
  validates :location, presence: true, length: { minumum: 2, maximum: 30 }
  
  belongs_to :user
end
