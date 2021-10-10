class Student < ApplicationRecord
  belongs_to :teacher

  validates :name, :matricula, :email, :birth_date, presence: true
  validates :matricula, uniqueness: true
  validates_length_of :matricula, is: 9
  validates_date :birth_date, on_or_before: lambda { Date.current }

  has_one_attached :image
end
