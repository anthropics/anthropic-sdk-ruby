# typed: strong

module Anthropic
  module Models
    BetaFallbackCreditRedeemed = Beta::BetaFallbackCreditRedeemed

    module Beta
      class BetaFallbackCreditRedeemed < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaFallbackCreditRedeemed,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # The reprice was applied: the retry is billed as if the conversation had been on
        # the retry model all along.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :redeemed)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
