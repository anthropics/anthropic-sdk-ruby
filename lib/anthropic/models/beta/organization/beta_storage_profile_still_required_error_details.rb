# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaStorageProfileStillRequiredErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :storage_profile_still_required]
          required :error_code, const: :storage_profile_still_required

          # @!method initialize(error_code: :storage_profile_still_required)
          #   This storage is bound to a different user profile from storage the Workspace has
          #   attached, or from active or draining storage it once had for safeguards data.
          #   Detaching storage the Workspace uses only for transcripts clears this. Detaching
          #   safeguards storage doesn't, so use a new Workspace instead.
          #
          #   @param error_code [Symbol, :storage_profile_still_required]
        end
      end
    end
  end
end
