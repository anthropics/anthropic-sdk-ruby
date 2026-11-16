# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsMemoryStoreArchivedRunErrorObject =
      Beta::BetaManagedAgentsMemoryStoreArchivedRunErrorObject

    module Beta
      class BetaManagedAgentsMemoryStoreArchivedRunErrorObject < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsMemoryStoreArchivedRunErrorObject,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable error description.
        sig { returns(String) }
        attr_accessor :message

        sig { returns(Symbol) }
        attr_accessor :type

        # A memory store referenced by the deployment is archived.
        sig { params(message: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # Human-readable error description.
          message:,
          type: :memory_store_archived_error
        )
        end

        sig { override.returns({ message: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
