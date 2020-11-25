# frozen_string_literal: true

class User < ApplicationRecord
  extend Devise::Models
  has_many :campaigns
  has_many :comments
  has_many :discussion_topics

  enum status: [:qualified, :not_qualified, :banned]
  enum user_type: [:Expert, :Novice]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  include DeviseTokenAuth::Concerns::User
end
