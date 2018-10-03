class Complemento < ActiveRecord::Base

  establish_connection :"production_netmultix"

  self.abstract_class = true

  self.table_name = 'ft25'

end