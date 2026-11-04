# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # One of the Plugin's skills has the name of an organization skill. `skill_name`
        # is that name.
        class BetaSkillNameTakenError < Anthropic::Errors::ConflictError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaSkillNameTakenErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
