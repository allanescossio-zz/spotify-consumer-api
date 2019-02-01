class Followed < ApplicationRecord
  validates_presence_of :name, :external_url, :genres
end
