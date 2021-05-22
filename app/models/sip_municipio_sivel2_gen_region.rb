class SipMunicipioSivel2GenRegion < ActiveRecord::Base
  belongs_to :region, class_name: 'Sivel2Gen::Region', 
    foreign_key: 'sivel2_gen_region_id'
  belongs_to :municipio, 
    class_name: 'Sip::Municipio',
    foreign_key: 'sip_municipio_id'
end
