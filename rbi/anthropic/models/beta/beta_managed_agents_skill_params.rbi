# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSkillParams = Beta::BetaManagedAgentsSkillParams

    module Beta
      # Skill to load in the session container.
      module BetaManagedAgentsSkillParams
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams,
              Anthropic::Beta::BetaManagedAgentsCustomSkillParams
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaManagedAgentsSkillParams::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
