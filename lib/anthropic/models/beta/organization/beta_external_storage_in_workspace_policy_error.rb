# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The External Storage can't be deleted while an Enterprise Frontier Safeguards
        # workspace policy lists it as allowed storage.
        class BetaExternalStorageInWorkspacePolicyError < Anthropic::Errors::BadRequestError
          # @!method error_code
          #   @return [Symbol, :external_storage_in_workspace_policy]

          # @return [Anthropic::Models::Beta::Organization::BetaExternalStorageInWorkspacePolicyErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaExternalStorageInWorkspacePolicyErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
