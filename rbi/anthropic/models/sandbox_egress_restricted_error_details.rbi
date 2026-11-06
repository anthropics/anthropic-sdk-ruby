# typed: strong

module Anthropic
  module Models
    class SandboxEgressRestrictedErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::SandboxEgressRestrictedErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The request came from a Claude sandbox with restricted network access, which is
      # not allowed to make this change. Send it from outside the sandbox, or from a
      # sandbox with unrestricted network access.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :sandbox_egress_restricted)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
