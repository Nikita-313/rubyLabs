class User < ApplicationRecord
  has_many :lab_reports

  validates :firstName, presence: true, length: {maximum: 100}
  validates :lastName, presence: true, length: {maximum: 100}
  validates :email, length: {maximum: 150}
end
