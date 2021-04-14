class Discussion < ApplicationRecord
 has_many :likes, as: :likeable
 belongs_to :member
end
