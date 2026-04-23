# typed: strong

module Anthropic
  module Models
    BetaUserProfileTrustGrant = Beta::BetaUserProfileTrustGrant

    module Beta
      class BetaUserProfileTrustGrant < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaUserProfileTrustGrant,
              Anthropic::Internal::AnyHash
            )
          end

        # Status of the trust grant.
        sig do
          returns(
            Anthropic::Beta::BetaUserProfileTrustGrant::Status::TaggedSymbol
          )
        end
        attr_accessor :status

        sig do
          params(
            status: Anthropic::Beta::BetaUserProfileTrustGrant::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Status of the trust grant.
          status:
        )
        end

        sig do
          override.returns(
            {
              status:
                Anthropic::Beta::BetaUserProfileTrustGrant::Status::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Status of the trust grant.
        module Status
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaUserProfileTrustGrant::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTIVE =
            T.let(
              :active,
              Anthropic::Beta::BetaUserProfileTrustGrant::Status::TaggedSymbol
            )
          PENDING =
            T.let(
              :pending,
              Anthropic::Beta::BetaUserProfileTrustGrant::Status::TaggedSymbol
            )
          REJECTED =
            T.let(
              :rejected,
              Anthropic::Beta::BetaUserProfileTrustGrant::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaUserProfileTrustGrant::Status::TaggedSymbol
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
