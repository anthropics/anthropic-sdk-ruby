# typed: strong

module Anthropic
  module Models
    BetaEnvironmentDeleteResponse = Beta::BetaEnvironmentDeleteResponse

    module Beta
      class BetaEnvironmentDeleteResponse < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaEnvironmentDeleteResponse,
              Anthropic::Internal::AnyHash
            )
          end

        # Environment identifier
        sig { returns(String) }
        attr_accessor :id

        # The type of response
        sig do
          returns(
            Anthropic::Beta::BetaEnvironmentDeleteResponse::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Response after deleting an environment.
        sig do
          params(
            id: String,
            type: Anthropic::Beta::BetaEnvironmentDeleteResponse::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Environment identifier
          id:,
          # The type of response
          type:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              type:
                Anthropic::Beta::BetaEnvironmentDeleteResponse::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # The type of response
        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaEnvironmentDeleteResponse::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENVIRONMENT_DELETED =
            T.let(
              :environment_deleted,
              Anthropic::Beta::BetaEnvironmentDeleteResponse::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaEnvironmentDeleteResponse::Type::TaggedSymbol
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
