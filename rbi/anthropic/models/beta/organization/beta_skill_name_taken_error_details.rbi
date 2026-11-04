# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSkillNameTakenErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaSkillNameTakenErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          sig { returns(String) }
          attr_accessor :skill_name

          # One of the Plugin's skills has the name of an organization skill. `skill_name`
          # is that name.
          sig do
            params(skill_name: String, error_code: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(skill_name:, error_code: :skill_name_taken)
          end

          sig { override.returns({ error_code: Symbol, skill_name: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
