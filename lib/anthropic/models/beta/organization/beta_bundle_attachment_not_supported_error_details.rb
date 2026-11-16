# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaBundleAttachmentNotSupportedErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :bundle_attachment_not_supported]
          required :error_code, const: :bundle_attachment_not_supported

          # @!method initialize(error_code: :bundle_attachment_not_supported)
          #   The Bundle has an attachment this API does not support editing, so its
          #   instructions can be changed only in claude.ai.
          #
          #   @param error_code [Symbol, :bundle_attachment_not_supported]
        end
      end
    end
  end
end
