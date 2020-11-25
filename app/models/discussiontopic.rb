class Discussiontopic < ApplicationRecord
  belongs_to :campaign
  has_many :comments, as: :commentable
  belongs_to :user
end
