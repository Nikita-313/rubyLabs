class LabReport < ApplicationRecord
  enum grade: {A: 0, B: 1, C: 2, D: 3, E: 4, FX: 5, F: 6}
  belongs_to :user

  validates :title, presence: true, length: {maximum: 250}
  validates :description, presence: true, length: {maximum: 500}
end
