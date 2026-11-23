# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaStorageVerificationFailedErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :storage_verification_failed]
          required :error_code, const: :storage_verification_failed

          # @!attribute failed_checks
          #   One entry for each check that failed.
          #
          #   @return [Array<Anthropic::Models::Beta::Organization::BetaExternalStorageFailedCheck>]
          required :failed_checks,
                   -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaExternalStorageFailedCheck] }

          # @!attribute field
          #   The request field at fault. Sent when the refused request is a Workspace's
          #   create or update.
          #
          #   @return [String, nil]
          optional :field, String, nil?: true

          # @!method initialize(failed_checks:, field: nil, error_code: :storage_verification_failed)
          #   The External Storage failed verification, so the request changed nothing.
          #   `failed_checks` lists what to fix.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaStorageVerificationFailedErrorDetails}
          #   for more details.
          #
          #   @param failed_checks [Array<Anthropic::Models::Beta::Organization::BetaExternalStorageFailedCheck>] One entry for each check that failed.
          #
          #   @param field [String, nil] The request field at fault. Sent when the refused request is a Workspace's creat
          #
          #   @param error_code [Symbol, :storage_verification_failed]
        end
      end
    end
  end
end
