# typed: strong

module Anthropic
  module Models
    class OrganizationTypeNotSupportedErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::OrganizationTypeNotSupportedErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The endpoint does not support the organization's type. Each endpoint's
      # description says which organization types it supports.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :organization_type_not_supported)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
