# typed: strong

module Anthropic
  module Models
    class CMEKContextUnavailableErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::CMEKContextUnavailableErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The workspace's encryption settings could not be read, so the request was
      # refused. Retry in a few minutes.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :cmek_context_unavailable)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
