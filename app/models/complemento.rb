class Complemento < ActiveRecord::Base

  establish_connection :"production_netmultix"

  self.abstract_class = true

  self.table_name = 'FT25'

  def serial
    self.ft25_folio.to_s(32)
  end

end