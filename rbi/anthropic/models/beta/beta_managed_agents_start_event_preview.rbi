# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsStartEventPreview =
      Beta::BetaManagedAgentsStartEventPreview

    module Beta
      module BetaManagedAgentsStartEventPreview
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentMessagePreview,
              Anthropic::Beta::BetaManagedAgentsAgentThinkingPreview
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsStartEventPreview::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
