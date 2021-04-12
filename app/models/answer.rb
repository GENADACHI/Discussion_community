class Answer < ApplicationRecord
 has_many :likes, as: :likeable
end
