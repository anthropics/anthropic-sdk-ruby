# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # This storage is bound to a different user profile from storage the Workspace has
        # attached, or from active or draining storage it once had for safeguards data.
        # Detaching storage the Workspace uses only for transcripts clears this. Detaching
        # safeguards storage doesn't, so use a new Workspace instead.
        class BetaStorageProfileStillRequiredError < Anthropic::Errors::BadRequestError
          # @!method error_code
          #   @return [Symbol, :storage_profile_still_required]

          # @return [Anthropic::Models::Beta::Organization::BetaStorageProfileStillRequiredErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaStorageProfileStillRequiredErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
