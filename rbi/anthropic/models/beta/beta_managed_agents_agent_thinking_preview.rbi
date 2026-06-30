# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentThinkingPreview =
      Beta::BetaManagedAgentsAgentThinkingPreview

    module Beta
      class BetaManagedAgentsAgentThinkingPreview < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentThinkingPreview,
              Anthropic::Internal::AnyHash
            )
          end

        # The id the buffered agent.thinking will carry if it is emitted. Start-only — no
        # event_delta events follow.
        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsAgentThinkingPreview::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            id: String,
            type:
              Anthropic::Beta::BetaManagedAgentsAgentThinkingPreview::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The id the buffered agent.thinking will carry if it is emitted. Start-only — no
          # event_delta events follow.
          id:,
          type:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              type:
                Anthropic::Beta::BetaManagedAgentsAgentThinkingPreview::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsAgentThinkingPreview::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AGENT_THINKING =
            T.let(
              :"agent.thinking",
              Anthropic::Beta::BetaManagedAgentsAgentThinkingPreview::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgentThinkingPreview::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
