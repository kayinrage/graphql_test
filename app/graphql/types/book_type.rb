module Types
  class BookType < Types::BaseObject
    field :author, Types::AuthorType, null: false
    field :genre, Enums::Genre, null: false

    field :id, ID, null: false

    field :publication_date, Integer, null: false
    field :title, String, null: false
  end
end
