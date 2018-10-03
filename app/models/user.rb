class User < ActiveRecord::Base

  establish_connection :"production_cimavnetmultix"

  self.abstract_class = true

  self.table_name = 'proveedores'

  has_secure_password

end