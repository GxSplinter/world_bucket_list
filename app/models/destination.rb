class Destination < ActiveRecord::Base
  belongs_to :user
  before_create :capitalize_name

  has_many :todos, -> { order('created_at') }

  validates_presence_of :name
  validate :name_unique_to_user

  def capitalize_name
    self.name.capitalize!
  end

  def name_unique_to_user
    if Destination.find_by(
        name: self.name.capitalize,
        user_id: self.user_id
      )

      errors.add(:name, "must be unique")
    end
  end
end
