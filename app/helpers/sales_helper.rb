module SalesHelper

  def active_sale?
    Sale.active.any?
  end

  def sale_info
    @sale = Sale.where("starts_on <= ? AND ends_on >= ?", Date.current, Date.current).first
  end

end