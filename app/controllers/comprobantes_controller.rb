class ComprobantesController  < ApplicationController

  def pdf

    folio = params[:folio] #.to_i(32) # eg PAYA170380
    send_file(
        "#{Rails.root}/private/facturas/#{folio}.pdf",
        filename: "#{folio}.pdf", type: "application/pdf", disposition: :inline
    )

  end


end