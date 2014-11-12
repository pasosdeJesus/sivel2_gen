# encoding: UTF-8
module Sivel2Gen
  class Conscaso < ActiveRecord::Base
    belongs_to :caso,class_name: 'Sivel2Gen::Caso'
  end
end
