# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaHumanReviewOnWithExternalStorageErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaHumanReviewOnWithExternalStorageErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # The request would leave the Workspace with
          # `inference_data_privacy.safeguards_storage` set to External Storage and
          # `inference_data_privacy.human_review` enabled. Anthropic doesn't offer human
          # review of data in a customer's own storage. Set `human_review` to `disabled`, or
          # `safeguards_storage` to `internal`.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :human_review_on_with_external_storage)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
