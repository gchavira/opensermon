class CreateCuentas < ActiveRecord::Migration
  def self.up
    create_table :cuentas do |t|
      t.string :usuario
      t.string :nombre
      t.string :contacto
      t.string :telefono
      t.string :email
      t.string :descripcion
      t.boolean :monitor
      t.boolean :status
      t.datetime :status_time
      t.boolean :status_notification_sent
      t.timestamps
    end
  end

  def self.down
    drop_table :cuentas
  end
end
