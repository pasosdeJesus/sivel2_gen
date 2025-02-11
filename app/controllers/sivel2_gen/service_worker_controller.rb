require 'sivel2_gen/concerns/controllers/service_worker_controller'

module Sivel2Gen
  class ServiceWorkerController < ApplicationController
    include Sivel2Gen::Concerns::Controllers::ServiceWorkerController
  end
end
