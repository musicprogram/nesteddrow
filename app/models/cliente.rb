class Cliente < ActiveRecord::Base
	has_many :pedidos


	extend FriendlyId
	friendly_id :contacto
end
