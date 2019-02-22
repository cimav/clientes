class ComprobantesController  < ApplicationController

  def pdf

    folio = params[:folio] #.to_i(32) # eg PAYA170380
    file_path = "#{Rails.root}/private/facturas/#{folio}.pdf"
    if File.exist?(file_path)
      send_file(
          file_path,
        filename: "#{folio}.pdf", type: "application/pdf", disposition: :inline
      )
    else
      render :plain => "PDF #{folio} no existe"
    end

  end


end