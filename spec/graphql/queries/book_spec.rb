require 'rails_helper'

module Queries
  RSpec.describe Book, type: :request do
    describe '.resolve' do
      it 'returns book for provided id' do
        author = create(:author)
        book =  create(:book, author: author, title: 'Hero', publication_date: 1984, genre: 'Horror')

        post '/graphql', params: { query: query(id: book.id) }

        json = JSON.parse(response.body)
        data = json['data']['book']

        expect(data).to include(
            'id'              => be_present,
            'title'           => 'Hero',
            'publicationDate' => 1984,
            'genre'           => 'Horror',
            'author'          => { 'id' => author.id.to_s }
          )
      end
    end

    def query(id:)
      <<~GQL
        query {
          book(id: #{id}) {
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
