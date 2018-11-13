class CardSerializer < ActiveModel::Serializer
  belongs_to :deck
  attributes :id, :name, :artist, :flavor, :imageUrl, :manaCost, :originalType, :rarity, :setName, :cmc
end
