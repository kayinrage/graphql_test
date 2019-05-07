module Queries
  class Books < Queries::BaseQuery
    description 'Find all books'

    type [Types::BookType], null: false

    def resolve
      ::Book.all
    end
  end
end
