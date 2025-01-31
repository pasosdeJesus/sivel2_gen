module Sivel2Gen
  module Concerns
    module Controllers
      module ServiceWorkerController
        extend ActiveSupport::Concern

        included do

          skip_forgery_protection
          def service_worker
            response.headers['Service-Worker'] = 'script' # Permite que el navegador lo registre
             
            #render file: Rails.root.join('public', 'service_worker.js'),
            #     content_type: 'application/javascript', layout: false 
          end

          def manifest
          end 
        end # included

      end
    end
  end
end

