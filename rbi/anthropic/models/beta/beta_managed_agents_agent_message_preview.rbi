# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentMessagePreview =
      Beta::BetaManagedAgentsAgentMessagePreview

    module Beta
      class BetaManagedAgentsAgentMessagePreview < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentMessagePreview,
              Anthropic::Internal::AnyHash
            )
          end

        # The id the buffered agent.message will carry if it is emitted. Matches the
        # event_id on this preview's event_delta events.
        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsAgentMessagePreview::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig do
          params(
            id: String,
            type:
              Anthropic::Beta::BetaManagedAgentsAgentMessagePreview::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The id the buffered agent.message will carry if it is emitted. Matches the
          # event_id on this preview's event_delta events.
          id:,
          type:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              type:
                Anthropic::Beta::BetaManagedAgentsAgentMessagePreview::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsAgentMessagePreview::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AGENT_MESSAGE =
            T.let(
              :"agent.message",
              Anthropic::Beta::BetaManagedAgentsAgentMessagePreview::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgentMessagePreview::Type::TaggedSymbol
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
