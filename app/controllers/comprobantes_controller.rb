class ComprobantesController  < ApplicationController

  def pdf

    folio = params[:folio] #.to_i(32)
    send_file(
        "#{Rails.root}/private/facturas/P#{folio}.pdf",
        filename: "P#{folio}.pdf", type: "application/pdf", disposition: :inline
    )

  end


end