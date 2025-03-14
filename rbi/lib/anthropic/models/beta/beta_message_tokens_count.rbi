# typed: strong

module Anthropic
  module Models
    BetaMessageTokensCount = T.type_alias { Beta::BetaMessageTokensCount }

    module Beta
      class BetaMessageTokensCount < Anthropic::BaseModel
        # The total number of tokens across the provided list of messages, system prompt,
        #   and tools.
        sig { returns(Integer) }
        def input_tokens
        end

        sig { params(_: Integer).returns(Integer) }
        def input_tokens=(_)
        end

        sig { params(input_tokens: Integer).returns(T.attached_class) }
        def self.new(input_tokens:)
        end

        sig { override.returns({input_tokens: Integer}) }
        def to_hash
        end
      end
    end
  end
end
