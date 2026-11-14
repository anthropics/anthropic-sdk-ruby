# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaBundleAttachmentNotSupportedErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaBundleAttachmentNotSupportedErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # The Bundle has an attachment this API does not support editing, so its
          # instructions can be changed only in claude.ai.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :bundle_attachment_not_supported)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
