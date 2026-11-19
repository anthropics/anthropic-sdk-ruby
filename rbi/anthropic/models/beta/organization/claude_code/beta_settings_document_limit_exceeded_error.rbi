# typed: strong

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
            sig { returns(Symbol) }
            def error_code
            end

            sig do
              returns(
                Anthropic::Beta::Organization::ClaudeCode::BetaSettingsDocumentLimitExceededErrorDetails
              )
            end
            def details
            end
          end
        end
      end
    end
  end
end
