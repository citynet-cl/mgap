module ApplicationHelper
  def delete_link(url)
    link_to "Anular",   url, method: :delete, data: { confirm: 'Seguro?' }, class: "btn btn-danger btn-sm"
  end

  def detalles_link(recurso)
  	link_to "Detalles", recurso, class: "btn btn-warning btn-sm"
  end

  def ordenable(columna, titulo = nil)
	  titulo ||= columna.titleize
	  clase_css = columna == ordenar_columna ? "current #{ordenar_direccion}" : nil
	  direction = (ordenar_columna && ordenar_direccion == "asc") ? "desc" : "asc"
	  #link_to titulo, :sort => columna, :direction => direction 	
	          link_to "#{titulo} <i class='#{direction == "desc" ? "glyphicon glyphicon-chevron-down" : "glyphicon glyphicon-chevron-up"}'></i>".html_safe, {:sort => columna, :direction => direction}, {:class => clase_css}

  end
end
