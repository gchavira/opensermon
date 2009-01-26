class CuentasController < ApplicationController
  # GET /cuentas
  # GET /cuentas.xml
  def index
    @cuentas = Cuenta.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cuentas }
    end
  end

  # GET /cuentas/1
  # GET /cuentas/1.xml
  def show
    @cuenta = Cuenta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cuenta }
    end
  end

  # GET /cuentas/new
  # GET /cuentas/new.xml
  def new
    @cuenta = Cuenta.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cuenta }
    end
  end

  # GET /cuentas/1/edit
  def edit
    @cuenta = Cuenta.find(params[:id])
  end

  # POST /cuentas
  # POST /cuentas.xml
  def create
    @cuenta = Cuenta.new(params[:cuenta])

    respond_to do |format|
      if @cuenta.save
        flash[:notice] = 'Cuenta creada con exito.'
        format.html { redirect_to(@cuenta) }
        format.xml  { render :xml => @cuenta, :status => :created, :location => @cuenta }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cuenta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cuentas/1
  # PUT /cuentas/1.xml
  def update
    @cuenta = Cuenta.find(params[:id])

    respond_to do |format|
      if @cuenta.update_attributes(params[:cuenta])
        flash[:notice] = 'Cuenta actualizada con exito.'
        format.html { redirect_to(@cuenta) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cuenta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cuentas/1
  # DELETE /cuentas/1.xml
  def destroy
    @cuenta = Cuenta.find(params[:id])
    @cuenta.destroy

    respond_to do |format|
      format.html { redirect_to(cuentas_url) }
      format.xml  { head :ok }
    end
  end
end
