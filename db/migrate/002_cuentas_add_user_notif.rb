class CuentasAddUserNotif < ActiveRecord::Migration
  def self.up
	  add_column :cuentas, :notificar_usuario, :boolean, { :null => false, :default => false }
  end

  def self.down
	  remove_column :cuentas, :notificar_usuario
  end
end
