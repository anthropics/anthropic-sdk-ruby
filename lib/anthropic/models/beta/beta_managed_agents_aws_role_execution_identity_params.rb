# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAWSRoleExecutionIdentityParams < Anthropic::Internal::Type::BaseModel
        # @!attribute role_arn
        #   The IAM role's ARN, e.g. "arn:aws:iam::123456789012:role/my-agent-runner".
        #   Maximum 2048 characters.
        #
        #   @return [String]
        required :role_arn, String

        # @!attribute type
        #
        #   @return [Symbol, :aws_role]
        required :type, const: :aws_role

        # @!method initialize(role_arn:, type: :aws_role)
        #   An AWS IAM role principal.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsAWSRoleExecutionIdentityParams} for
        #   more details.
        #
        #   @param role_arn [String] The IAM role's ARN, e.g. "arn:aws:iam::123456789012:role/my-agent-runner". Maxim
        #
        #   @param type [Symbol, :aws_role]
      end
    end

    BetaManagedAgentsAWSRoleExecutionIdentityParams = Beta::BetaManagedAgentsAWSRoleExecutionIdentityParams
  end
end
