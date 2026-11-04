# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaEnvironmentArchivedErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :environment_archived]
        required :error_code, const: :environment_archived

        # @!method initialize(error_code: :environment_archived)
        #   The environment is archived, so it cannot be updated.
        #
        #   @param error_code [Symbol, :environment_archived]
      end
    end

    BetaEnvironmentArchivedErrorDetails = Beta::BetaEnvironmentArchivedErrorDetails
  end
end
