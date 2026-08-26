# typed: strong

module Anthropic
  module Models
    BetaOrganization = Beta::BetaOrganization

    module Beta
      class BetaOrganization < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaOrganization,
              Anthropic::Internal::AnyHash
            )
          end

        # ID of the Organization.
        sig { returns(String) }
        attr_accessor :id

        # Name of the Organization.
        sig { returns(String) }
        attr_accessor :name

        # Object type.
        #
        # For Organizations, this is always `"organization"`.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(id: String, name: String, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # ID of the Organization.
          id:,
          # Name of the Organization.
          name:,
          # Object type.
          #
          # For Organizations, this is always `"organization"`.
          type: :organization
        )
        end

        sig { override.returns({ id: String, name: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
