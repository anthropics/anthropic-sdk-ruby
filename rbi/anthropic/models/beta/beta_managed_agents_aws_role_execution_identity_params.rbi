# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAWSRoleExecutionIdentityParams =
      Beta::BetaManagedAgentsAWSRoleExecutionIdentityParams

    module Beta
      class BetaManagedAgentsAWSRoleExecutionIdentityParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAWSRoleExecutionIdentityParams,
              Anthropic::Internal::AnyHash
            )
          end

        # The IAM role's ARN, e.g. "arn:aws:iam::123456789012:role/my-agent-runner".
        # Maximum 2048 characters.
        sig { returns(String) }
        attr_accessor :role_arn

        sig { returns(Symbol) }
        attr_accessor :type

        # An AWS IAM role principal.
        sig { params(role_arn: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # The IAM role's ARN, e.g. "arn:aws:iam::123456789012:role/my-agent-runner".
          # Maximum 2048 characters.
          role_arn:,
          type: :aws_role
        )
        end

        sig { override.returns({ role_arn: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
