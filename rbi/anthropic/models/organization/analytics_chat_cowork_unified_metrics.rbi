# typed: strong

module Anthropic
  module Models
    module Organization
      class AnalyticsChatCoworkUnifiedMetrics < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::AnalyticsChatCoworkUnifiedMetrics,
              Anthropic::Internal::AnyHash
            )
          end

        # Chat activity recorded while members had Chat and Cowork unified turned on.
        sig do
          returns(
            Anthropic::Organization::AnalyticsChatCoworkUnifiedChatMetrics
          )
        end
        attr_reader :chat

        sig do
          params(
            chat:
              Anthropic::Organization::AnalyticsChatCoworkUnifiedChatMetrics::OrHash
          ).void
        end
        attr_writer :chat

        # Cowork session activity recorded while members had Chat and Cowork unified
        # turned on.
        sig do
          returns(
            Anthropic::Organization::AnalyticsChatCoworkUnifiedSessionsMetrics
          )
        end
        attr_reader :sessions

        sig do
          params(
            sessions:
              Anthropic::Organization::AnalyticsChatCoworkUnifiedSessionsMetrics::OrHash
          ).void
        end
        attr_writer :sessions

        # Activity in Chat and Cowork unified for one user on one day: `chat` holds chat
        # activity and `sessions` holds Cowork session activity.
        sig do
          params(
            chat:
              Anthropic::Organization::AnalyticsChatCoworkUnifiedChatMetrics::OrHash,
            sessions:
              Anthropic::Organization::AnalyticsChatCoworkUnifiedSessionsMetrics::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Chat activity recorded while members had Chat and Cowork unified turned on.
          chat:,
          # Cowork session activity recorded while members had Chat and Cowork unified
          # turned on.
          sessions:
        )
        end

        sig do
          override.returns(
            {
              chat:
                Anthropic::Organization::AnalyticsChatCoworkUnifiedChatMetrics,
              sessions:
                Anthropic::Organization::AnalyticsChatCoworkUnifiedSessionsMetrics
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
