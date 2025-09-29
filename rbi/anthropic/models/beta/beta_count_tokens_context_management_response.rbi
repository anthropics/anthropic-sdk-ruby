# typed: strong

module Anthropic
  module Models
    BetaCountTokensContextManagementResponse =
      Beta::BetaCountTokensContextManagementResponse

    module Beta
      class BetaCountTokensContextManagementResponse < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCountTokensContextManagementResponse,
              Anthropic::Internal::AnyHash
            )
          end

        # The original token count before context management was applied
        sig { returns(Integer) }
        attr_accessor :original_input_tokens

        sig { params(original_input_tokens: Integer).returns(T.attached_class) }
        def self.new(
          # The original token count before context management was applied
          original_input_tokens:
        )
        end

        sig { override.returns({ original_input_tokens: Integer }) }
        def to_hash
        end
      end
    end
  end
end
