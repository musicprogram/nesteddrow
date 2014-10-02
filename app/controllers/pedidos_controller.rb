class PedidosController < ApplicationController
  before_action :set_pedido

  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = @cliente.pedidos.all 
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)
    @pedido.cliente_id = @cliente.id

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to cliente_pedidos_path(@cliente), notice: 'Pedido creado con exito.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to cliente_pedidos_path(@cliente), notice: 'Pedido actualizado con exito.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to cliente_pedidos_path(@cliente), notice: 'Pedido eliminado con exito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @cliente = Cliente.find(params[:cliente_id])
      @pedido = Pedido.find(params[:id]) if params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:cliente_id, :fechaPedido, :descripcion, :fechaEntrega, :usuario)
    end
end
