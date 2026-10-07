# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsWebFetchURLSourceUserInputParams =
      Beta::BetaManagedAgentsWebFetchURLSourceUserInputParams

    module Beta
      # Whether URLs in the text of user messages may be fetched. Accepts the string
      # "all" or "none", or the object {"type": "all"} or {"type": "none"}. Responses
      # use the object form.
      module BetaManagedAgentsWebFetchURLSourceUserInputParams
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceShorthand::TaggedSymbol,
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceUserInput::Variants
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceUserInputParams::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
