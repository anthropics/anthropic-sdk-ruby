# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeletedSession = Beta::BetaManagedAgentsDeletedSession

    module Beta
      class BetaManagedAgentsDeletedSession < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsDeletedSession,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Symbol) }
        attr_accessor :type

        # Confirmation that a `session` has been permanently deleted.
        sig { params(id: String, type: Symbol).returns(T.attached_class) }
        def self.new(id:, type: :session_deleted)
        end

        sig { override.returns({ id: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
