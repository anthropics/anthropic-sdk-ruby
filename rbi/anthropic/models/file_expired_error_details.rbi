# typed: strong

module Anthropic
  module Models
    class FileExpiredErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::FileExpiredErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The file's `expires_at` has passed, so its content is no longer available.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :file_expired)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
