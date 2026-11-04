# typed: strong

module Anthropic
  module Models
    BetaInvalidMetadataErrorDetails = Beta::BetaInvalidMetadataErrorDetails

    module Beta
      class BetaInvalidMetadataErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaInvalidMetadataErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # `metadata` has too many keys, a key or value that is too long, or a reserved
        # key. The message names each problem.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :invalid_metadata)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
