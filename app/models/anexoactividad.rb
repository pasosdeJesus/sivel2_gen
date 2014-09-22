# encoding: UTF-8
class Anexoactividad < ActiveRecord::Base
  belongs_to :actividad, foreign_key: "actividad_id"

  has_attached_file :adjunto, 
    :path => Sivel2Gen.ruta_anexos + "/act_:id_:filename"
  validates_attachment_content_type :adjunto, 
    :content_type => ['text/plain', /.*/]
  validates_attachment_presence :adjunto

  validates_presence_of :descripcion
end
