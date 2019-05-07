require 'rails_helper'

module Queries
  RSpec.describe Author, type: :request do
    describe '.resolve' do
      it 'returns author for provided id' do
        author = create(:author, first_name: 'Lee', last_name: 'Child', date_of_birth: Date.parse('1954-10-29'))
        book   = create(:book, author: author)

        post '/graphql', params: { query: query(id: author.id) }

        json = JSON.parse(response.body)
        data = json['data']['author']

        expect(data).to include(
          'id'          => be_present,
          'firstName'   => 'Lee',
          'lastName'    => 'Child',
          'dateOfBirth' => '1954-10-29',
          'books'       => [{ 'id' => book.id.to_s }]
        )
      end
    end

    def query(id:)
      <<~GQL
        query {
          author(id: #{id}) {
            id
            firstName
            lastName
            dateOfBirth
            books {
              id
            }
          }
        }
      GQL
    end
  end
end
