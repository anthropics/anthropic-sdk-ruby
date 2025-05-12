# typed: strong

module Anthropic
  module Models
    BetaMessageTokensCount = Beta::BetaMessageTokensCount

    module Beta
      class BetaMessageTokensCount < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaMessageTokensCount,
              Anthropic::Internal::AnyHash
            )
          end

        # The total number of tokens across the provided list of messages, system prompt,
        # and tools.
        sig { returns(Integer) }
        attr_accessor :input_tokens

        sig { params(input_tokens: Integer).returns(T.attached_class) }
        def self.new(
          # The total number of tokens across the provided list of messages, system prompt,
          # and tools.
          input_tokens:
        )
        end

        sig { override.returns({ input_tokens: Integer }) }
        def to_hash
        end
      end
    end
  end
end
