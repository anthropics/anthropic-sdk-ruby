# typed: strong

module Anthropic
  module Models
    class ParentOrganizationRequiredErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ParentOrganizationRequiredErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The endpoint serves only organizations that belong to a parent organization, and
      # this organization belongs to none.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :parent_organization_required)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
