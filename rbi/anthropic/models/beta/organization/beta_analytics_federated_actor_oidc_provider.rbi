# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsFederatedActorOIDCProvider < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsFederatedActorOIDCProvider,
                Anthropic::Internal::AnyHash
              )
            end

          # The federation issuer's URL.
          sig { returns(T.nilable(String)) }
          attr_accessor :issuer

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(issuer: T.nilable(String), type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # The federation issuer's URL.
            issuer:,
            type: :oidc
          )
          end

          sig { override.returns({ issuer: T.nilable(String), type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
