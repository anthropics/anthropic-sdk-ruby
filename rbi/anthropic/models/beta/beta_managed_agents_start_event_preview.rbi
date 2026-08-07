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

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(type: T.any(Symbol, String), id: String).returns(
            Anthropic::Beta::BetaManagedAgentsStartEventPreview::Variants
          )
        end
        def self.new(
          type:,
          # The id the buffered agent.message will carry if it is emitted. Matches the
          # event_id on this preview's event_delta events.
          id:
        )
        end
      end
    end
  end
end
