require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cuentas/show.html.erb" do
  include CuentasHelper
  before(:each) do
    assigns[:cuenta] = @cuenta = stub_model(Cuenta,
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

  it "should render attributes in a box" do
    render "/cuentas/show.html.erb"
    response.should have_text(/Peer:.*?100/m)
    response.should have_text(/Nombre:.*?Company/m)
    response.should have_text(/Contacto:.*?Company Man/m)
    response.should have_text(/Telefono:.*?1234567/m)
    response.should have_text(/Email:.*?some@email.com/m)
    response.should have_text(/Descripci&oacute;n:.*?Company Description/m)
    response.should have_text(/Monitor:.*?Si/m)
    response.should have_text(/Notificar Cliente:.*?Si/m)
  end
end

