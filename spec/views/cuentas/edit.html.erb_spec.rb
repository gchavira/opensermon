require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cuentas/edit.html.erb" do
  include CuentasHelper
  
  before(:each) do
    assigns[:cuenta] = @cuenta = stub_model(Cuenta,
      :new_record?              => false,
      :usuario                  => '100',
      :nombre                   => 'Company',
      :contacto                 => 'Company Man',
      :telefono                 => '1234567',
      :email                    => 'some@email.com',
      :descripcion              => 'Company Description',
      :monitor                  => true,
      :notificar_usuario        => true
    )
  end

  it "should render edit form" do
    render "/cuentas/edit.html.erb"
    response.should have_tag("form[action=#{cuenta_path(@cuenta)}][method=post]") do
      with_tag("input#cuenta_usuario[name=?]", "cuenta[usuario]")
      with_tag("input#cuenta_nombre[name=?]", "cuenta[nombre]")
      with_tag("input#cuenta_contacto[name=?]", "cuenta[contacto]")
      with_tag("input#cuenta_telefono[name=?]", "cuenta[telefono]")
      with_tag("input#cuenta_email[name=?]", "cuenta[email]")
      with_tag("input#cuenta_monitor[name=?]", "cuenta[monitor]")
      with_tag("input#cuenta_notificar_usuario[name=?]", "cuenta[notificar_usuario]")
      with_tag("textarea#cuenta_descripcion[name=?]", "cuenta[descripcion]")
    end
  end
end


