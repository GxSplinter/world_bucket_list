class User < ActiveRecord::Base
  has_many :destinations
  has_many :todos, through: :destinations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
