# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          # The field that a list of review cases is sorted by: `created_at` or
          # `updated_at`.
          module BetaComplianceReviewCaseOrderBy
            extend Anthropic::Internal::Type::Enum

            # Sort by when Anthropic sent the case.
            CREATED_AT = :created_at

            # Sort by when the case last changed.
            UPDATED_AT = :updated_at

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
