json.array!(@pedidos) do |pedido|
  json.extract! pedido, :id, :cliente_id, :fechaPedido, :descripcion, :fechaEntrega, :usuario
  json.url pedido_url(pedido, format: :json)
end
