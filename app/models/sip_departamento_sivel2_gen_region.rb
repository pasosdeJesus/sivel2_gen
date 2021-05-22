class SipDepartamentoSivel2GenRegion < ActiveRecord::Base
  belongs_to :region, class_name: 'Sivel2Gen::Region', 
    foreign_key: 'sivel2_gen_region_id'
  belongs_to :departamento, 
    class_name: 'Sip::Departamento',
    foreign_key: 'sip_departamento_id'
end
