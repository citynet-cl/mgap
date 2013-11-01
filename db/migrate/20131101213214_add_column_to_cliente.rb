class AddColumnToCliente < ActiveRecord::Migration
  def change
    add_column :clientes, :rut, :string
    add_column :clientes, :email, :string
    add_column :clientes, :fecha_registro, :date
    add_column :clientes, :direccion, :string
    add_column :clientes, :fono, :integer
  end
end
