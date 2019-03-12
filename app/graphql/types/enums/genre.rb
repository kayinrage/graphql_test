module Types
  module Enums
    class Genre < Types::BaseEnum
      description 'All available genres'

      value('Horror', 'super scary book')
      value('Thriller', 'super exciting book')
      value('Mystery', 'super interesting book')
    end
  end
end
