# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          class BetaSettingsDocumentLimitExceededErrorDetails < Anthropic::Internal::Type::BaseModel
            # @!attribute error_code
            #
            #   @return [Symbol, :settings_document_limit_exceeded]
            required :error_code, const: :settings_document_limit_exceeded

            # @!method initialize(error_code: :settings_document_limit_exceeded)
            #   The organization has reached its limit of settings documents, counting unused
            #   ones. An owner can remove unused documents in claude.ai. Deleting a group's
            #   settings or clearing the default settings also frees a document, if nothing else
            #   uses it. None of these works once the organization has also reached its settings
            #   history limit.
            #
            #   @param error_code [Symbol, :settings_document_limit_exceeded]
          end
        end
      end
    end
  end
end
