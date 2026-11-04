# typed: strong

module Anthropic
  module Models
    # The file's `expires_at` has passed, so its content is no longer available.
    class FileExpiredError < Anthropic::Errors::NotFoundError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::FileExpiredErrorDetails) }
      def details
      end
    end
  end
end
