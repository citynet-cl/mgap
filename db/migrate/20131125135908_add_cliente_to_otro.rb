class AddClienteToOtro < ActiveRecord::Migration
  def change
    add_reference :otros, :cliente, index: true
  end
end
