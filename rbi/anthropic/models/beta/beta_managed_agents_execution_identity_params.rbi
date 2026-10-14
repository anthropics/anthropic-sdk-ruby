# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsExecutionIdentityParams =
      Beta::BetaManagedAgentsExecutionIdentityParams

    module Beta
      # Execution principal for runs of this agent: `service_account` (the default) or
      # `aws_role`.
      module BetaManagedAgentsExecutionIdentityParams
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAWSRoleExecutionIdentityParams,
              Anthropic::Beta::BetaManagedAgentsServiceAccountExecutionIdentityParams
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsExecutionIdentityParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AWS_ROLE =
            T.let(
              :aws_role,
              Anthropic::Beta::BetaManagedAgentsExecutionIdentityParams::Type::TaggedSymbol
            )
          SERVICE_ACCOUNT =
            T.let(
              :service_account,
              Anthropic::Beta::BetaManagedAgentsExecutionIdentityParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsExecutionIdentityParams::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsExecutionIdentityParams::Variants
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
              Anthropic::Beta::BetaManagedAgentsExecutionIdentityParams::Type::OrSymbol,
            role_arn: String
          ).returns(
            Anthropic::Beta::BetaManagedAgentsExecutionIdentityParams::Variants
          )
        end
        def self.new(
          type:,
          # The IAM role's ARN, e.g. "arn:aws:iam::123456789012:role/my-agent-runner".
          # Maximum 2048 characters.
          role_arn: nil
        )
        end
      end
    end
  end
end
