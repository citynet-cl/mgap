class AddDeletedAtToCliente < ActiveRecord::Migration
  def change
    add_column :clientes, :deleted_at, :datetime
  end
end
