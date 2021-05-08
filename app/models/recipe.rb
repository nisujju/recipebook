class Recipe < ApplicationRecord
  include ContentfulModel
  
  validates :contentful_id, presence: true, uniqueness: true
  
  SPACE_ID = ENV['SPACE_ID']
  ACCESS_TOKEN = ENV['ACCESS_TOKEN']
  CONTENT_TYPE_ID = 'recipe'.freeze
end