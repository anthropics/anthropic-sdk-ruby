# frozen_string_literal: true

module Anthropic
  module Models
    class FileExpiredErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :file_expired]
      required :error_code, const: :file_expired

      # @!method initialize(error_code: :file_expired)
      #   The file's `expires_at` has passed, so its content is no longer available.
      #
      #   @param error_code [Symbol, :file_expired]
    end
  end
end
