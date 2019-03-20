module Types
  class MutationType < Types::BaseObject
    field :create_book, mutation: Mutations::Books::CreateBook
    field :destroy_book, mutation: Mutations::Books::DestroyBook
    field :update_book, mutation: Mutations::Books::UpdateBook
  end
end
