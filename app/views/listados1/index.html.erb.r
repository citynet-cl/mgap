<%= javascript_include_tag params[:controller] %>

<table id="listado1" class="table table-striped table-hover">
    <thead>
      <tr>
            <th>Fecha Registro</th>
            <th>HH</th>
      </tr>
    </thead>

    <tbody>
    <% @tareas_listado1.each do |tarea| %>
	    <tr>
            <td><%= tarea.fecha_registro.strftime("%m/%d/%Y") %></td>
            <td><%= tarea.hh %></td>
	    </tr>
      <% end %>
    </tbody>
  </table>

