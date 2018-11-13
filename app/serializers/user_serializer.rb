class UserSerializer < ActiveModel::Serializer
  has_many :decks
end
