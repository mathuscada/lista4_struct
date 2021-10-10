class LanguageSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :teacher_id, :documentations_url
  
  belongs_to :teacher

  def documentations_url
    if object.documentations.attached?
      documentations = object.documentations
      docs_url = []
      documentations.each do |documentation|
        docs_url.push(rails_blob_path(documentation, only_path: true))
      end
      docs_url
    else
      nil
    end
  end
end
