require 'rails_helper'

module Queries
  RSpec.describe Books, type: :request do
    describe '.resolve' do
      it 'returns all books' do
        author = create(:author)
        create(:book, author: author, title: 'Hero', publication_date: 1984, genre: 'Horror')
        create(:book, author: author, title: 'Gifted', publication_date: 1988, genre: 'Thriller')

        post '/graphql', params: { query: query }

        json = JSON.parse(response.body)
        data = json['data']['books']

        expect(data).to match_array [
          hash_including(
            'id'              => be_present,
            'title'           => 'Hero',
            'publicationDate' => 1984,
            'genre'           => 'Horror',
            'author'          => { 'id' => author.id.to_s }
          ),
          hash_including(
            'id'              => be_present,
            'title'           => 'Gifted',
            'publicationDate' => 1988,
            'genre'           => 'Thriller',
            'author'          => { 'id' => author.id.to_s }
          )
        ]
      end
    end

    def query
      <<~GQL
        query {
          books {
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
