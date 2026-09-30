# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsSkillChatMetrics < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsSkillChatMetrics,
                Anthropic::Internal::AnyHash
              )
            end

          # Number of distinct conversations in which the skill was used. A skill counts as
          # used only when it is explicitly activated — the model (or the user, via the
          # skill's slash command) invokes it, reading its instructions into context as part
          # of that activation. Skills that are merely installed or listed as available, or
          # whose content reaches the context without an activation (preloaded,
          # hook-injected, or read as a plain file), are not counted. Approximate (HLL,
          # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
          # count cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_conversation_skill_used_count

          # Claude.ai activity metrics for a single skill on a given day.
          sig do
            params(
              distinct_conversation_skill_used_count: T.nilable(Integer)
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of distinct conversations in which the skill was used. A skill counts as
            # used only when it is explicitly activated — the model (or the user, via the
            # skill's slash command) invokes it, reading its instructions into context as part
            # of that activation. Skills that are merely installed or listed as available, or
            # whose content reaches the context without an activation (preloaded,
            # hook-injected, or read as a plain file), are not counted. Approximate (HLL,
            # typical error <2%) in date-range mode. Null on aggregated rows where a distinct
            # count cannot be computed.
            distinct_conversation_skill_used_count:
          )
          end

          sig do
            override.returns(
              { distinct_conversation_skill_used_count: T.nilable(Integer) }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
