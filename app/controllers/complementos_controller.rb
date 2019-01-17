class ComplementosController  < ApplicationController

  before_action :authorize

  def index

    rfc = @current_user ? @current_user.rfc.strip + '%' : 'none'
    @complementos = Complemento.select(:ft25_clave, :ft25_rfc, :ft25_nombre, :ft25_docto, :ft25_tipo, :ft25_serie, :ft25_folio, :ft25_fecha, :ft25_status, :ft25_timbrado).where("ft25_rfc LIKE ? AND ft25_timbrado = ?", rfc, "2")

    respond_to do |format|
      format.html
      format.json {
        render json: @complementos
      }
    end

  end

  def docto_pdf

    rfc = "%#{session[:user_rfc].strip}%"
    folio = params[:folio].to_i(32)
    complemento = Complemento.select(:ft25_folio).where("ft25_rfc LIKE ? AND ft25_timbrado = ? AND ft25_folio = ?", rfc, "2", folio.to_i).first rescue nil
    if complemento
      send_file(
          "#{Rails.root}/private/facturas/PA#{folio}.pdf",
          filename: "PA#{folio}.pdf", type: "application/pdf", disposition: :inline
      )
      send_file(
          "#{Rails.root}/private/xml/PA#{folio}.xml",
          filename: "PA#{folio}.xml", type: "application/xml", disposition: :inline
      )
    else
      redirect_to login_path, notice: "Complemento no corresponde al RFC"
    end

  end

end