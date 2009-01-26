require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe MainController do
	
	def mock_cuenta(stubs={})
    @mock_cuenta ||= mock_model(Cuenta, stubs)
  end

	def mock_location(stubs={})
    @mock_location ||= mock_model(Location, stubs)
  end

	describe "responding to GET index" do
		it "should return a list of accounts online and locations available" do
			Cuenta.should_receive(:find).with(:all, :order => :usuario).and_return([mock_cuenta])
			Location.should_receive(:find).with(:all, :order => :username).and_return([mock_location])
			get :index
			assigns[:cuentas].should == [mock_cuenta]
			assigns[:online].should == [mock_location]
			response.should render_template('index')
		end
	end
end
