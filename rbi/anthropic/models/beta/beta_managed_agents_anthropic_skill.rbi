# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAnthropicSkill = Beta::BetaManagedAgentsAnthropicSkill

    module Beta
      class BetaManagedAgentsAnthropicSkill < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAnthropicSkill,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :skill_id

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(String) }
        attr_accessor :version

        # A resolved Anthropic-managed skill.
        sig do
          params(skill_id: String, version: String, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(skill_id:, version:, type: :anthropic)
        end

        sig do
          override.returns({ skill_id: String, type: Symbol, version: String })
        end
        def to_hash
        end
      end
    end
  end
end
