# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTranscriptsStorageRequiredErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :transcripts_storage_required]
          required :error_code, const: :transcripts_storage_required

          # @!method initialize(error_code: :transcripts_storage_required)
          #   In an organization managed through AWS or Google Cloud, the request would leave
          #   the Workspace with `inference_data_privacy.human_review` disabled and
          #   `inference_data_privacy.transcripts_storage` not set to External Storage. With
          #   human review disabled, the organization reviews its own flagged requests, and it
          #   receives them only in that storage.
          #
          #   @param error_code [Symbol, :transcripts_storage_required]
        end
      end
    end
  end
end
