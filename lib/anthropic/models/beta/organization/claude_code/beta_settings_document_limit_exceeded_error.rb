# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          # The organization has reached its limit of settings documents, counting unused
          # ones. An owner can remove unused documents in claude.ai. Deleting a group's
          # settings or clearing the default settings also frees a document, if nothing else
          # uses it. None of these works once the organization has also reached its settings
          # history limit.
          class BetaSettingsDocumentLimitExceededError < Anthropic::Errors::BadRequestError
            # @!method error_code
            #   @return [Symbol, :settings_document_limit_exceeded]

            # @return [Anthropic::Models::Beta::Organization::ClaudeCode::BetaSettingsDocumentLimitExceededErrorDetails]
            def details
              Anthropic::Internal::Type::Converter.coerce(
                Anthropic::Beta::Organization::ClaudeCode::BetaSettingsDocumentLimitExceededErrorDetails,
                Anthropic::Internal::Util.dig(body, [:error, :details])
              )
            end
          end
        end
      end
    end
  end
end
