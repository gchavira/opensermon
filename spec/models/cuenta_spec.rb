require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'pp'

describe Cuenta do
	fixtures :all
	
	before do
		@valid_attributes = {
			:usuario => "200",
			:nombre => "Company 200"
		}
		@peer_duplicate_attributes = {
			:usuario => "101",
			:nombre => "Company 101"
		}
		@noname_attributes = {
			:usuario => "202"
		}
	end
	
	context "Checking Attributes" do
		it "should create a new instance given valid attributes" do
			Cuenta.create!(@valid_attributes)
		end

		it "should fail with invalid attributes" do
			lambda { Cuenta.create!(@peer_duplicate_attributes) }.should raise_error(ActiveRecord::RecordInvalid)
			lambda { Cuenta.create!(@noname) }.should raise_error(ActiveRecord::RecordInvalid)
		end
		
		it "should reject a Cuenta with a non-numeric 2>digits>5 usuario" do
			lambda { Cuenta.create!(:usuario => '1', :nombre => 'filler') }.should raise_error(ActiveRecord::RecordInvalid)
			lambda { Cuenta.create!(:usuario => '123456', :nombre => 'filler') }.should raise_error(ActiveRecord::RecordInvalid)
			lambda { Cuenta.create!(:usuario => '1234a', :nombre => 'filler') }.should raise_error(ActiveRecord::RecordInvalid)
			lambda { Cuenta.create!(:usuario => 'a1234', :nombre => 'filler') }.should raise_error(ActiveRecord::RecordInvalid)
			lambda { Cuenta.create!(:usuario => '12%34', :nombre => 'filler') }.should raise_error(ActiveRecord::RecordInvalid)
			lambda { Cuenta.create!(:usuario => '1á23', :nombre => 'filler') }.should raise_error(ActiveRecord::RecordInvalid)
			lambda { Cuenta.create!(:usuario => 'abc', :nombre => 'filler') }.should raise_error(ActiveRecord::RecordInvalid)
		end
	end
	
	context "Checking Methods" do
		it "should return a valid status string" do
			cuentas(:peer_101).status_str.should match(/Not monitoring|Online|Offline/)
		end
		
		it "should return a valid monitor string" do
			cuentas(:peer_102).monitor_str.should match(/Si|No/) # :)
		end
	end
	
end



