require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/main/index.html.erb" do
	
	def mock_location(n, stubs={})
		@mock_location ||= []
    @mock_location[n] ||= mock_model(Location, stubs)
	end
	
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
    assigns[:online] = [
			mock_location(1,
				:id            => 18517,
				:username      => '111',
				:domain        => nil,
				:contact       => 'sip:111@70.254.119.33',
				:received      => nil,
				:path          => nil,
				:expires       => DateTime.parse('2009-01-23 18:07:05'),
				:q             => -1.00,
				:callid        => '1e80996a397ef5754825fd6a7973d069@127.0.0.1',
				:cseq          => 2089,
				:last_modified => DateTime.parse('2009-01-23 18:05:05'),
				:flags         => 0,
				:cflags        => 0,
				:user_agent    => 'Asterisk PBX',
				:socket        => 'udp:69.64.70.92:5060',
				:methods       => nil,
				:validez       => '24:00:00'
		  ),
			mock_location(2,
				:id            => 18518,
				:username      => '110',
				:domain        => nil,
				:contact       => 'sip:110@70.254.119.33',
				:received      => nil,
				:path          => nil,
				:expires       => DateTime.parse('2009-01-23 18:07:05'),
				:q             => -1.00,
				:callid        => '152fbeef40b5cd7006554ffb246ceade@127.0.0.1',
				:cseq          => 2089,
				:last_modified => DateTime.parse('2009-01-23 18:05:05'),
				:flags         => 0,
				:cflags        => 0,
				:user_agent    => 'Asterisk PBX',
				:socket        => 'udp:69.64.70.92:5060',
				:methods       => nil,
				:validez       => '24:00:00'
		  ),

			mock_location(3,
				:id            => 17761,
				:username      => '200',
				:domain        => nil,
				:contact       => 'sip:200@71.40.16.226:5090',
				:received      => nil,
				:path          => nil,
				:expires       => DateTime.parse('2009-01-22 18:05:49'),
				:q             => -1.00,
				:callid        => '1c288451093c92122f0e99ab1cfe0d17@127.0.0.1',
				:cseq          => 1906,
				:last_modified => DateTime.parse('2009-01-22 18:03:49'),
				:flags         => 0,
				:cflags        => 0,
				:user_agent    => 'Asterisk PBX',
				:socket        => 'udp:69.64.70.92:5060',
				:methods       => nil,
				:validez       => '24:00:00'
		  )
    ]
  end

  it "should render list of cuentas" do
    render "/main/index.html.erb"
		
		response.should have_text(/Conexiones/)
		response.should have_tag("div#onlines>table>tbody tr", /111.*?2009-01-23.*?70\.254\.119\.33.*?Asterisk PBX/m)
		response.should have_tag("div#onlines>table>tbody tr", /110.*?2009-01-23.*?70\.254\.119\.33.*?Asterisk PBX/m)
		response.should have_tag("div#onlines>table>tbody tr", /200.*?2009-01-22.*?71\.40\.16\.226.*?Asterisk PBX/m)

		response.should have_text(/Monitores/)
		response.should have_tag("div#conexiones>table>tbody tr", /101.*?Company 101/m)
		response.should have_tag("div#conexiones>table>tbody tr", /102.*?Company 102/m)
  end
end



