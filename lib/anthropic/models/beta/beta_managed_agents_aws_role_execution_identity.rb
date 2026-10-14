# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsAWSRoleExecutionIdentity < Anthropic::Internal::Type::BaseModel
        # @!attribute role_arn
        #   The IAM role's ARN.
        #
        #   @return [String]
        required :role_arn, String

        # @!attribute type
        #
        #   @return [Symbol, :aws_role]
        required :type, const: :aws_role

        # @!method initialize(role_arn:, type: :aws_role)
        #   An AWS IAM role principal as returned in API responses.
        #
        #   @param role_arn [String] The IAM role's ARN.
        #
        #   @param type [Symbol, :aws_role]
      end
    end

    BetaManagedAgentsAWSRoleExecutionIdentity = Beta::BetaManagedAgentsAWSRoleExecutionIdentity
  end
end
