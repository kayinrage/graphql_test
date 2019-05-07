module Queries
  class Book < Queries::BaseQuery
    description 'Find a book by ID'

    argument :id, ID, required: true

    type Types::BookType, null: false

    def resolve(id:)
      ::Book.find(id)
    end
  end
end
