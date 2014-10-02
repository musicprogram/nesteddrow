json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nombreORazonSocial, :cCoNit, :direccion, :ciudad, :telefono, :email, :contacto
  json.url cliente_url(cliente, format: :json)
end
