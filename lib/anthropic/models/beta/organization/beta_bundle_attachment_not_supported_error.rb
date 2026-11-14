# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The Bundle has an attachment this API does not support editing, so its
        # instructions can be changed only in claude.ai.
        class BetaBundleAttachmentNotSupportedError < Anthropic::Errors::BadRequestError
          # @!method error_code
          #   @return [Symbol, :bundle_attachment_not_supported]

          # @return [Anthropic::Models::Beta::Organization::BetaBundleAttachmentNotSupportedErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaBundleAttachmentNotSupportedErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
