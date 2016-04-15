class Book < ActiveRecord::Base
  belongs_to :category
  belongs_to :Author
  belongs_to :publisher
end
