class Teacher < ApplicationRecord
    has_one :language, dependent: :destroy
    has_many :students, dependent: :destroy

    validates :name, :email, :birth_date, presence: true
    validates_date :birth_date, on_or_before: lambda { Date.current }
end
