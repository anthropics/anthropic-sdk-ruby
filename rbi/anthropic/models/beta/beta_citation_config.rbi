# typed: strong

module Anthropic
  module Models
    BetaCitationConfig = Beta::BetaCitationConfig

    module Beta
      class BetaCitationConfig < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCitationConfig,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :enabled

        sig { params(enabled: T::Boolean).returns(T.attached_class) }
        def self.new(enabled:)
        end

        sig { override.returns({ enabled: T::Boolean }) }
        def to_hash
        end
      end
    end
  end
end
