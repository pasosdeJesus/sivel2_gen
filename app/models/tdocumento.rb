# encoding: UTF-8
class Tdocumento < ActiveRecord::Base

  validates :nombre, presence: true, allow_blank: false
  validates :fechacreacion, presence: true, allow_blank: false
end
