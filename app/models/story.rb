class Story < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates_presence_of :content, presence: :true
  validates_presence_of :title, presence: :true
end
