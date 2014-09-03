# encoding: UTF-8
class Usuario < ActiveRecord::Base
  @current_usuario = -1
  attr_accessor :current_usuario

  # Otros modulos de devise disponibles:
  # :recoverable :registerable, :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :lockable

	has_many :caso_usuario, foreign_key: "id_usuario", validate: true
	has_many :caso_etiqueta, foreign_key: "id_usuario", validate: true

	belongs_to :regionsjr, foreign_key: "regionsjr_id", validate: true

  #http://stackoverflow.com/questions/1200568/using-rails-how-can-i-set-my-primary-key-to-not-be-an-integer-typed-column
  self.primary_key=:id

  def email_required?
    false
  end
  validates_uniqueness_of :nusuario, :case_sensitive => false
  validates_format_of :nusuario, :with  => /\A[a-zA-Z_0-9]+\z/

  validates_presence_of :nusuario
  validates_presence_of :idioma
  validates_presence_of :rol
  validates_presence_of :email
  validates_presence_of :sign_in_count
  validates_presence_of :fechacreacion

  validates_presence_of   :encrypted_password, :on=>:create
  validates_confirmation_of   :encrypted_password, :on=>:create
  
end
