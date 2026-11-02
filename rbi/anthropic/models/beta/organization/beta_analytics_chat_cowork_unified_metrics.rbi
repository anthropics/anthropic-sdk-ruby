# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsChatCoworkUnifiedMetrics < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedMetrics,
                Anthropic::Internal::AnyHash
              )
            end

          # Chat activity recorded while members had Chat and Cowork unified turned on.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedChatMetrics
            )
          end
          attr_reader :chat

          sig do
            params(
              chat:
                Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedChatMetrics::OrHash
            ).void
          end
          attr_writer :chat

          # Cowork session activity recorded while members had Chat and Cowork unified
          # turned on.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedSessionsMetrics
            )
          end
          attr_reader :sessions

          sig do
            params(
              sessions:
                Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedSessionsMetrics::OrHash
            ).void
          end
          attr_writer :sessions

          # Activity in Chat and Cowork unified for one user on one day: `chat` holds chat
          # activity and `sessions` holds Cowork session activity.
          sig do
            params(
              chat:
                Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedChatMetrics::OrHash,
              sessions:
                Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedSessionsMetrics::OrHash
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
                  Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedChatMetrics,
                sessions:
                  Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedSessionsMetrics
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
