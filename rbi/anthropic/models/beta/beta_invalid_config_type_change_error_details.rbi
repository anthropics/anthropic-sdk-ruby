# typed: strong

module Anthropic
  module Models
    BetaInvalidConfigTypeChangeErrorDetails =
      Beta::BetaInvalidConfigTypeChangeErrorDetails

    module Beta
      class BetaInvalidConfigTypeChangeErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaInvalidConfigTypeChangeErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # `config.type` differs from the environment's stored type, which cannot change
        # after creation.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :invalid_config_type_change)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
