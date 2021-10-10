class StudentSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :matricula, :email, :birth_date, :teacher_id, :image_url

  belongs_to :teacher

  def image_url
    if object.image.attached?
      rails_blob_path(object.image, only_path: true)
    else
      nil
    end
  end
end
