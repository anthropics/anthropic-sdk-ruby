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

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(id: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # The id the buffered agent.message will carry if it is emitted. Matches the
          # event_id on this preview's event_delta events.
          id:,
          type: :"agent.message"
        )
        end

        sig { override.returns({ id: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
