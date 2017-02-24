class House < ActiveRecord::Base
  has_many :characters, dependent: :destroy
  belongs_to :user
end
