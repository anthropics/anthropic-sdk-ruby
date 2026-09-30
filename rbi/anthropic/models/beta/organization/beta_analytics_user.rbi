# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsUser < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsUser,
                Anthropic::Internal::AnyHash
              )
            end

          # Tagged user identifier (e.g. `user_...`)
          sig { returns(String) }
          attr_accessor :id

          # Email address of the user
          sig { returns(String) }
          attr_accessor :email_address

          # Object type. Always `user`.
          sig { returns(Symbol) }
          attr_accessor :type

          # A user in the organization, identified by tagged id and email address.
          sig do
            params(id: String, email_address: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # Tagged user identifier (e.g. `user_...`)
            id:,
            # Email address of the user
            email_address:,
            # Object type. Always `user`.
            type: :user
          )
          end

          sig do
            override.returns(
              { id: String, email_address: String, type: Symbol }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
