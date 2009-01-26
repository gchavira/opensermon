require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CuentasController do

  def mock_cuenta(stubs={})
    @mock_cuenta ||= mock_model(Cuenta, stubs)
  end
	
	describe "responding to GET index" do
		it "should assign and show all cuentas in @cuentas" do
			Cuenta.should_receive(:find).with(:all).and_return([mock_cuenta])
			get :index
			assigns[:cuentas].should == [mock_cuenta]
			response.should render_template('index')
		end
		describe "with mime-type of XML" do
			it "should return them as XML" do
				request.env["HTTP_ACCEPT"] = "application/xml"
				Cuenta.should_receive(:find).with(:all).and_return(cuentas = mock("Array of Cuentas"))
				cuentas.should_receive(:to_xml).and_return("generated XML")
				get :index
				response.body.should == "generated XML"
			end
		end
	end

  describe "responding to GET show" do

    it "should expose the requested cuenta as @cuenta" do
      Cuenta.should_receive(:find).with("37").and_return(mock_cuenta)
      get :show, :id => "37"
      assigns[:cuenta].should equal(mock_cuenta)
    end
    
    describe "with mime type of xml" do

      it "should render the requested cuenta as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Cuenta.should_receive(:find).with("37").and_return(mock_cuenta)
        mock_cuenta.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new cuenta as @cuenta" do
      Cuenta.should_receive(:new).and_return(mock_cuenta)
      get :new
      assigns[:cuenta].should equal(mock_cuenta)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested cuenta as @cuenta" do
      Cuenta.should_receive(:find).with("37").and_return(mock_cuenta)
      get :edit, :id => "37"
      assigns[:cuenta].should equal(mock_cuenta)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created cuenta as @cuenta" do
        Cuenta.should_receive(:new).with({'these' => 'params'}).and_return(mock_cuenta(:save => true))
        post :create, :cuenta => {:these => 'params'}
        assigns(:cuenta).should equal(mock_cuenta)
      end

      it "should redirect to the created cuenta" do
        Cuenta.stub!(:new).and_return(mock_cuenta(:save => true))
        post :create, :cuenta => {}
        response.should redirect_to(cuenta_url(mock_cuenta))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved cuenta as @cuenta" do
        Cuenta.stub!(:new).with({'these' => 'params'}).and_return(mock_cuenta(:save => false))
        post :create, :cuenta => {:these => 'params'}
        assigns(:cuenta).should equal(mock_cuenta)
      end

      it "should re-render the 'new' template" do
        Cuenta.stub!(:new).and_return(mock_cuenta(:save => false))
        post :create, :cuenta => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested cuenta" do
        Cuenta.should_receive(:find).with("37").and_return(mock_cuenta)
        mock_cuenta.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cuenta => {:these => 'params'}
      end

      it "should expose the requested cuenta as @cuenta" do
        Cuenta.stub!(:find).and_return(mock_cuenta(:update_attributes => true))
        put :update, :id => "1"
        assigns(:cuenta).should equal(mock_cuenta)
      end

      it "should redirect to the cuenta" do
        Cuenta.stub!(:find).and_return(mock_cuenta(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(cuenta_url(mock_cuenta))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested cuenta" do
        Cuenta.should_receive(:find).with("37").and_return(mock_cuenta)
        mock_cuenta.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cuenta => {:these => 'params'}
      end

      it "should expose the cuenta as @cuenta" do
        Cuenta.stub!(:find).and_return(mock_cuenta(:update_attributes => false))
        put :update, :id => "1"
        assigns(:cuenta).should equal(mock_cuenta)
      end

      it "should re-render the 'edit' template" do
        Cuenta.stub!(:find).and_return(mock_cuenta(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested cuenta" do
      Cuenta.should_receive(:find).with("37").and_return(mock_cuenta)
      mock_cuenta.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the cuentas list" do
      Cuenta.stub!(:find).and_return(mock_cuenta(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(cuentas_url)
    end

  end


end
