class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  # embedded_in :post, :inverse_of => :comment
  # belongs_to :user
  
  validates_length_of :content, :within => 1..10000

  field :content
  field :url
  field :byline

  referenced_in :user

  # validates_length_of :content, :within => 1..10000
end
