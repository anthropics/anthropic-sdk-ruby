# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSkillNameTakenErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :skill_name_taken]
          required :error_code, const: :skill_name_taken

          # @!attribute skill_name
          #
          #   @return [String]
          required :skill_name, String

          # @!method initialize(skill_name:, error_code: :skill_name_taken)
          #   One of the Plugin's skills has the name of an organization skill. `skill_name`
          #   is that name.
          #
          #   @param skill_name [String]
          #   @param error_code [Symbol, :skill_name_taken]
        end
      end
    end
  end
end
