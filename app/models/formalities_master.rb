class FormalitiesMaster < ActiveRecord::Base
	has_many :formalities_documents
	has_many :transfer_documents, through: :formalities_documents
end
