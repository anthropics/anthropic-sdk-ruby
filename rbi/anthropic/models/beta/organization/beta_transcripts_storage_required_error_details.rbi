# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTranscriptsStorageRequiredErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaTranscriptsStorageRequiredErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # In an organization managed through AWS or Google Cloud, the request would leave
          # the Workspace with `inference_data_privacy.human_review` disabled and
          # `inference_data_privacy.transcripts_storage` not set to External Storage. With
          # human review disabled, the organization reviews its own flagged requests, and it
          # receives them only in that storage.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :transcripts_storage_required)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
