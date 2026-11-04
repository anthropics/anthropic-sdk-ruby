# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # One of the Plugin's skills has the name of an organization skill. `skill_name`
        # is that name.
        class BetaSkillNameTakenError < Anthropic::Errors::ConflictError
          # @!method error_code
          #   @return [Symbol, :skill_name_taken]

          # @return [Anthropic::Models::Beta::Organization::BetaSkillNameTakenErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaSkillNameTakenErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
