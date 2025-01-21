# == Schema Information
#
# Table name: dog_listings
#
#  id           :bigint           not null, primary key
#  breed        :string
#  name         :string
#  price        :integer
#  seller_email :string
#  sex          :string
#  weight       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class DogListing < ApplicationRecord
  validates :name, :breed, :weight, :price, :seller_email, presence: true
  validates :price, :weight, numericality: { greater_than_or_equal_to: 0 }
end
