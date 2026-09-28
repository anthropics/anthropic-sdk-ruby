# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginUserActor < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaPluginUserActor,
                Anthropic::Internal::AnyHash
              )
            end

          # The member's email address; may be null, for example when they are no longer a
          # member of the organization.
          sig { returns(T.nilable(String)) }
          attr_accessor :email_address

          # A member of the organization.
          sig { returns(Symbol) }
          attr_accessor :type

          # The member's User ID.
          sig { returns(String) }
          attr_accessor :user_id

          sig do
            params(
              email_address: T.nilable(String),
              user_id: String,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The member's email address; may be null, for example when they are no longer a
            # member of the organization.
            email_address:,
            # The member's User ID.
            user_id:,
            # A member of the organization.
            type: :user_actor
          )
          end

          sig do
            override.returns(
              {
                email_address: T.nilable(String),
                type: Symbol,
                user_id: String
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
