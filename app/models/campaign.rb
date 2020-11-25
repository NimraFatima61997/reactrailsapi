class Campaign < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :discussiontopics
  has_many :tags
  enum estimated_duration: [:within_1_week, :within_1_month, :within_3_months]
end
