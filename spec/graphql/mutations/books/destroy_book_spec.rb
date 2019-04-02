require 'rails_helper'

module Mutations
  module Books
    RSpec.describe DestroyBook, type: :request do
      describe 'resolve' do
        it 'removes a book' do
          book = create(:book)

          expect do
            post '/graphql', params: { query: query(id: book.id) }
          end.to change { Book.count }.by(-1)
        end

        it 'returns a book' do
          book = create(:book, title: 'Hero', publication_date: 1984, genre: 'Horror')

          post '/graphql', params: { query: query(id: book.id) }
          json = JSON.parse(response.body)
          data = json['data']['destroyBook']

          expect(data).to include(
            'id'              => be_present,
            'title'           => 'Hero',
            'publicationDate' => 1984,
            'genre'           => 'Horror',
            'author'          => { 'id' => be_present }
          )
        end
      end

      def query(id:)
        <<~GQL
            mutation {
              destroyBook(
                id: #{id}
              ) {
                id
                title
                publicationDate
                genre
                author {
                  id
                }
              }
            }
        GQL
      end
    end
  end
end
