class TeacherSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :email, :birth_date, :image_url

  has_many :students
  has_one :language

  def image_url
    if object.image.attached?
      rails_blob_path(object.image, only_path: true)
    else
      nil
    end
  end
end
