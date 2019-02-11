stephen = Author.create(first_name: 'Stephen', last_name: 'King', date_of_birth: Date.parse('1947-09-21'))
lee     = Author.create(first_name: 'Lee', last_name: 'Child', date_of_birth: Date.parse('1954-10-29'))

Book.create(title: 'The Shining', author: stephen, publication_date: 1977, genre: 'Horror')
Book.create(title: 'Carrie', author: stephen, publication_date: 1974, genre: 'Horror')
Book.create(title: 'It', author: stephen, publication_date: 1986, genre: 'Horror')
Book.create(title: 'Green mile', author: stephen, publication_date: 1996, genre: 'Mystery')
Book.create(title: 'Killing Floor', author: lee, publication_date: 1997, genre: 'Thriller')
Book.create(title: 'Die Trying', author: lee, publication_date: 1998, genre: 'Thriller')
