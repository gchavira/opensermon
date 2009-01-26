class MainController < ApplicationController

  def index
    @cuentas = Cuenta.find(:all, :order => :usuario)
    @online = Location.find(:all, :order => :username)
  end
end
