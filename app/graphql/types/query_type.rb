module Types
  class QueryType < Types::BaseObject
    field :author, resolver: Queries::Author
    field :authors, resolver: Queries::Authors
    field :book, resolver: Queries::Book
    field :books, resolver: Queries::Books
  end
end
