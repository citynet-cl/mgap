module ApplicationHelper
  def delete_link(url)
    link_to "Anular",   url, method: :delete, data: { confirm: 'Seguro?' }, class: "btn btn-danger btn-sm"
  end

  def detalles_link(recurso)
  	link_to "Detalles", recurso, class: "btn btn-warning btn-sm"
  end
end
