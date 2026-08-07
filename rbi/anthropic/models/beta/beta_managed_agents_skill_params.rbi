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

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: T.any(Symbol, String),
            skill_id: String,
            version: T.nilable(String)
          ).returns(Anthropic::Beta::BetaManagedAgentsSkillParams::Variants)
        end
        def self.new(
          type:,
          # Identifier of the Anthropic skill (e.g., "xlsx").
          skill_id:,
          # Version to pin. Defaults to latest if omitted.
          version: nil
        )
        end
      end
    end
  end
end
