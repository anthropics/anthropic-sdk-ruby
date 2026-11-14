# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The Bundle has an attachment this API does not support editing, so its
        # instructions can be changed only in claude.ai.
        class BetaBundleAttachmentNotSupportedError < Anthropic::Errors::BadRequestError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaBundleAttachmentNotSupportedErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
