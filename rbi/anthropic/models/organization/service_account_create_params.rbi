# typed: strong

module Anthropic
  module Models
    module Organization
      class ServiceAccountCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::ServiceAccountCreateParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Slug identifier (lowercase, digits, hyphens). Unique within the organization; a
        # duplicate name returns 409.
        sig { returns(String) }
        attr_accessor :name

        # Optional free-text description.
        sig { returns(T.nilable(String)) }
        attr_accessor :description

        # Org-level role. Defaults to `developer`.
        sig do
          returns(
            T.nilable(
              Anthropic::Organization::ServiceAccountCreateParams::OrganizationRole::OrSymbol
            )
          )
        end
        attr_reader :organization_role

        sig do
          params(
            organization_role:
              Anthropic::Organization::ServiceAccountCreateParams::OrganizationRole::OrSymbol
          ).void
        end
        attr_writer :organization_role

        sig do
          params(
            name: String,
            description: T.nilable(String),
            organization_role:
              Anthropic::Organization::ServiceAccountCreateParams::OrganizationRole::OrSymbol,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Slug identifier (lowercase, digits, hyphens). Unique within the organization; a
          # duplicate name returns 409.
          name:,
          # Optional free-text description.
          description: nil,
          # Org-level role. Defaults to `developer`.
          organization_role: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              name: String,
              description: T.nilable(String),
              organization_role:
                Anthropic::Organization::ServiceAccountCreateParams::OrganizationRole::OrSymbol,
              request_options: Anthropic::RequestOptions
            }
          )
        end
        def to_hash
        end

        # Org-level role. Defaults to `developer`.
        module OrganizationRole
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Organization::ServiceAccountCreateParams::OrganizationRole
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ADMIN =
            T.let(
              :admin,
              Anthropic::Organization::ServiceAccountCreateParams::OrganizationRole::TaggedSymbol
            )
          DEVELOPER =
            T.let(
              :developer,
              Anthropic::Organization::ServiceAccountCreateParams::OrganizationRole::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Organization::ServiceAccountCreateParams::OrganizationRole::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
