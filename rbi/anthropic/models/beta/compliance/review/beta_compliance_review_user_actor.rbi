# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class BetaComplianceReviewUserActor < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewUserActor,
                  Anthropic::Internal::AnyHash
                )
              end

            # The user's email address. Set only for a current member of an organization that
            # the API key can read.
            sig { returns(T.nilable(String)) }
            attr_accessor :email_address

            sig { returns(Symbol) }
            attr_accessor :type

            # The ID of the user (`user_...`).
            sig { returns(String) }
            attr_accessor :user_id

            # A signed-in user.
            sig do
              params(
                email_address: T.nilable(String),
                user_id: String,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The user's email address. Set only for a current member of an organization that
              # the API key can read.
              email_address:,
              # The ID of the user (`user_...`).
              user_id:,
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
end
