require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cuentas/index.html.erb" do
  include CuentasHelper
  
  before(:each) do
    assigns[:cuentas] = [
      stub_model(Cuenta,
				:usuario                  => '101',
				:nombre                   => 'Company 101',
				:contacto                 => 'Company Man 101',
				:telefono                 => '1000101',
				:email                    => '101@email.com',
				:descripcion              => 'Company Description 101',
				:monitor                  => true,
				:notificar_usuario        => true
      ),
      stub_model(Cuenta,
				:usuario                  => '102',
				:nombre                   => 'Company 102',
				:contacto                 => 'Company Man 102',
				:telefono                 => '1000102',
				:email                    => '102@email.com',
				:descripcion              => 'Company Description 102',
				:monitor                  => true,
				:notificar_usuario        => true
      )
    ]
  end

  it "should render list of cuentas" do
    render "/cuentas/index.html.erb"
		response.should have_tag("tr>td", '101'            )
		response.should have_tag("tr>td", 'Company 101'    )            
		response.should have_tag("tr>td", 'Company Man 101')
		response.should have_tag("tr>td", '1000101'        )
		response.should have_tag("tr>td", '101@email.com'  )
		response.should have_tag("tr>td", 'Si'             )

		response.should have_tag("tr>td", '102'            )
		response.should have_tag("tr>td", 'Company 102'    )            
		response.should have_tag("tr>td", 'Company Man 102')
		response.should have_tag("tr>td", '1000102'        )
		response.should have_tag("tr>td", '102@email.com'  )
		response.should have_tag("tr>td", 'Si'             )
  end
end

