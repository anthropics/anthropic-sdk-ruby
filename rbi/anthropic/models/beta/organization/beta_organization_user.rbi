# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaOrganizationUser < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaOrganizationUser,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the User.
          sig { returns(String) }
          attr_accessor :id

          # RFC 3339 datetime string indicating when the User joined the Organization.
          sig { returns(Time) }
          attr_accessor :added_at

          # Email of the User.
          sig { returns(String) }
          attr_accessor :email

          # Name of the User.
          sig { returns(String) }
          attr_accessor :name

          # Organization role of the User.
          sig { returns(Anthropic::Beta::BetaOrganizationRole::TaggedSymbol) }
          attr_accessor :role

          # Object type.
          #
          # For Users, this is always `"user"`.
          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(
              id: String,
              added_at: Time,
              email: String,
              name: String,
              role: Anthropic::Beta::BetaOrganizationRole::OrSymbol,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the User.
            id:,
            # RFC 3339 datetime string indicating when the User joined the Organization.
            added_at:,
            # Email of the User.
            email:,
            # Name of the User.
            name:,
            # Organization role of the User.
            role:,
            # Object type.
            #
            # For Users, this is always `"user"`.
            type: :user
          )
          end

          sig do
            override.returns(
              {
                id: String,
                added_at: Time,
                email: String,
                name: String,
                role: Anthropic::Beta::BetaOrganizationRole::TaggedSymbol,
                type: Symbol
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
