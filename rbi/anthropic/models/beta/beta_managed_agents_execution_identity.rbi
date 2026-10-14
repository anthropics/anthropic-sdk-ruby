# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsExecutionIdentity =
      Beta::BetaManagedAgentsExecutionIdentity

    module Beta
      # Execution principal for runs of this agent as returned in API responses.
      module BetaManagedAgentsExecutionIdentity
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAWSRoleExecutionIdentity,
              Anthropic::Beta::BetaManagedAgentsServiceAccountExecutionIdentity
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsExecutionIdentity::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AWS_ROLE =
            T.let(
              :aws_role,
              Anthropic::Beta::BetaManagedAgentsExecutionIdentity::Type::TaggedSymbol
            )
          SERVICE_ACCOUNT =
            T.let(
              :service_account,
              Anthropic::Beta::BetaManagedAgentsExecutionIdentity::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsExecutionIdentity::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsExecutionIdentity::Variants
            ]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsExecutionIdentity::Type::OrSymbol,
            role_arn: String
          ).returns(
            Anthropic::Beta::BetaManagedAgentsExecutionIdentity::Variants
          )
        end
        def self.new(
          type:,
          # The IAM role's ARN.
          role_arn: nil
        )
        end
      end
    end
  end
end
