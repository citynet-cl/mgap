module ApplicationHelper
  #def delete_link(url)
  #  link_to "Anular",   url, method: :delete, data: { confirm: 'Seguro?' }, class: "btn btn-danger btn-sm"
  #end
  def delete_link(url)
	  link_to content_tag(:span, ' Anular', class: "glyphicon glyphicon-trash"), url, method: :delete, data: { confirm: 'Seguro?'},  :class => 'btn btn-danger btn-sm ' 
  end

  def edit_link(url)
	  link_to content_tag(:span, ' Editar', class: "glyphicon glyphicon-edit"), url, :class => 'btn btn-primary btn-sm ' 
  end

  def detalles_link(url)
	  link_to content_tag(:span, ' Detalles', class: "glyphicon glyphicon-info-sign"), url, :class => 'btn btn-warning btn-sm ' 
  end

  def cerrar_proyecto(url)
	  link_to content_tag(:span, ' Cerrar', class: "glyphicon glyphicon-book"), url, method: :put, data: { confirm: 'Seguro?'},  :class => 'btn btn-success btn-sm ' 
  end

  def copiar_tarea(url)
	  link_to content_tag(:span, ' Copiar', class: "glyphicon glyphicon-align-justify"), url, :class => 'btn btn-success btn-sm', "data-no-turbolink" => true 
  end
end
