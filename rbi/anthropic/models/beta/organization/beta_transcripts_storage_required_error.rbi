# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # In an organization managed through AWS or Google Cloud, the request would leave
        # the Workspace with `inference_data_privacy.human_review` disabled and
        # `inference_data_privacy.transcripts_storage` not set to External Storage. With
        # human review disabled, the organization reviews its own flagged requests, and it
        # receives them only in that storage.
        class BetaTranscriptsStorageRequiredError < Anthropic::Errors::BadRequestError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaTranscriptsStorageRequiredErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
