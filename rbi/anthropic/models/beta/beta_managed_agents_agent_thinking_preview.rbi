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

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(id: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # The id the buffered agent.thinking will carry if it is emitted. Start-only — no
          # event_delta events follow.
          id:,
          type: :"agent.thinking"
        )
        end

        sig { override.returns({ id: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
