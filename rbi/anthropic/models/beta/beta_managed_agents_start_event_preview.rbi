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

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsStartEventPreview::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AGENT_MESSAGE =
            T.let(
              :"agent.message",
              Anthropic::Beta::BetaManagedAgentsStartEventPreview::Type::TaggedSymbol
            )
          AGENT_THINKING =
            T.let(
              :"agent.thinking",
              Anthropic::Beta::BetaManagedAgentsStartEventPreview::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsStartEventPreview::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
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
