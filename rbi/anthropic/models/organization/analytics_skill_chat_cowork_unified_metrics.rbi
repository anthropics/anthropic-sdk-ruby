# typed: strong

module Anthropic
  module Models
    module Organization
      class AnalyticsSkillChatCoworkUnifiedMetrics < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::AnalyticsSkillChatCoworkUnifiedMetrics,
              Anthropic::Internal::AnyHash
            )
          end

        # A skill's use in chat conversations recorded while members had Chat and Cowork
        # unified turned on.
        sig do
          returns(
            Anthropic::Organization::AnalyticsSkillChatCoworkUnifiedChatMetrics
          )
        end
        attr_reader :chat

        sig do
          params(
            chat:
              Anthropic::Organization::AnalyticsSkillChatCoworkUnifiedChatMetrics::OrHash
          ).void
        end
        attr_writer :chat

        # A skill's use in Cowork sessions recorded while members had Chat and Cowork
        # unified turned on.
        sig do
          returns(
            Anthropic::Organization::AnalyticsSkillChatCoworkUnifiedSessionsMetrics
          )
        end
        attr_reader :sessions

        sig do
          params(
            sessions:
              Anthropic::Organization::AnalyticsSkillChatCoworkUnifiedSessionsMetrics::OrHash
          ).void
        end
        attr_writer :sessions

        # A skill's use in Chat and Cowork unified on one day: `chat` holds its use in
        # chat conversations and `sessions` its use in Cowork sessions.
        sig do
          params(
            chat:
              Anthropic::Organization::AnalyticsSkillChatCoworkUnifiedChatMetrics::OrHash,
            sessions:
              Anthropic::Organization::AnalyticsSkillChatCoworkUnifiedSessionsMetrics::OrHash
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
                Anthropic::Organization::AnalyticsSkillChatCoworkUnifiedChatMetrics,
              sessions:
                Anthropic::Organization::AnalyticsSkillChatCoworkUnifiedSessionsMetrics
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
