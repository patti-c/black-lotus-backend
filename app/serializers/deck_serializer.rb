class DeckSerializer < ActiveModel::Serializer
  belongs_to :user
  has_many :cards
  attributes :id, :name, :cards
end
