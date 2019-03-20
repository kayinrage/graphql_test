module Mutations
  module Books
    class DestroyBook < ::Mutations::BaseMutation
      argument :id, Integer, required: true

      type Types::BookType

      def resolve(id:)
        Book.find(id).destroy
      end
    end
  end
end
