# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAWSRoleExecutionIdentity =
      Beta::BetaManagedAgentsAWSRoleExecutionIdentity

    module Beta
      class BetaManagedAgentsAWSRoleExecutionIdentity < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAWSRoleExecutionIdentity,
              Anthropic::Internal::AnyHash
            )
          end

        # The IAM role's ARN.
        sig { returns(String) }
        attr_accessor :role_arn

        sig { returns(Symbol) }
        attr_accessor :type

        # An AWS IAM role principal as returned in API responses.
        sig { params(role_arn: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # The IAM role's ARN.
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
