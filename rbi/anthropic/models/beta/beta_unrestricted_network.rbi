# typed: strong

module Anthropic
  module Models
    BetaUnrestrictedNetwork = Beta::BetaUnrestrictedNetwork

    module Beta
      class BetaUnrestrictedNetwork < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaUnrestrictedNetwork,
              Anthropic::Internal::AnyHash
            )
          end

        # Network policy type
        sig { returns(Symbol) }
        attr_accessor :type

        # Unrestricted network access.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(
          # Network policy type
          type: :unrestricted
        )
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
