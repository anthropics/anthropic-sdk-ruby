# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsSkillChatCoworkUnifiedMetrics < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedMetrics,
                Anthropic::Internal::AnyHash
              )
            end

          # A skill's use in chat conversations recorded while members had Chat and Cowork
          # unified turned on.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedChatMetrics
            )
          end
          attr_reader :chat

          sig do
            params(
              chat:
                Anthropic::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedChatMetrics::OrHash
            ).void
          end
          attr_writer :chat

          # A skill's use in Cowork sessions recorded while members had Chat and Cowork
          # unified turned on.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedSessionsMetrics
            )
          end
          attr_reader :sessions

          sig do
            params(
              sessions:
                Anthropic::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedSessionsMetrics::OrHash
            ).void
          end
          attr_writer :sessions

          # A skill's use in Chat and Cowork unified on one day: `chat` holds its use in
          # chat conversations and `sessions` its use in Cowork sessions.
          sig do
            params(
              chat:
                Anthropic::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedChatMetrics::OrHash,
              sessions:
                Anthropic::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedSessionsMetrics::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # A skill's use in chat conversations recorded while members had Chat and Cowork
            # unified turned on.
            chat:,
            # A skill's use in Cowork sessions recorded while members had Chat and Cowork
            # unified turned on.
            sessions:
          )
          end

          sig do
            override.returns(
              {
                chat:
                  Anthropic::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedChatMetrics,
                sessions:
                  Anthropic::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedSessionsMetrics
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
