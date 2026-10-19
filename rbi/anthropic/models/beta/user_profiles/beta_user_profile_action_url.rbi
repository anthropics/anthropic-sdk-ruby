# typed: strong

module Anthropic
  module Models
    module Beta
      module UserProfiles
        class BetaUserProfileActionURL < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::UserProfiles::BetaUserProfileActionURL,
                Anthropic::Internal::AnyHash
              )
            end

          # When the URL stops working, in RFC 3339 format.
          sig { returns(Time) }
          attr_accessor :expires_at

          # Object type. Always `user_profile_action_url`.
          sig { returns(Symbol) }
          attr_accessor :type

          # The URL to give to the person who takes the action. Anyone who holds it can open
          # it until `expires_at`.
          sig { returns(String) }
          attr_accessor :url

          # A URL to give to the person who takes the requested action.
          sig do
            params(expires_at: Time, url: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # When the URL stops working, in RFC 3339 format.
            expires_at:,
            # The URL to give to the person who takes the action. Anyone who holds it can open
            # it until `expires_at`.
            url:,
            # Object type. Always `user_profile_action_url`.
            type: :user_profile_action_url
          )
          end

          sig do
            override.returns({ expires_at: Time, type: Symbol, url: String })
          end
          def to_hash
          end
        end
      end
    end
  end
end
