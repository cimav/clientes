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

end