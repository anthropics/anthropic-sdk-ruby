# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Execution principal for runs of this agent as returned in API responses.
      module BetaManagedAgentsExecutionIdentity
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # An AWS IAM role principal as returned in API responses.
        variant :aws_role, -> { Anthropic::Beta::BetaManagedAgentsAWSRoleExecutionIdentity }

        # The Anthropic-managed service account as returned in API responses.
        variant :service_account, -> { Anthropic::Beta::BetaManagedAgentsServiceAccountExecutionIdentity }

        module Type
          extend Anthropic::Internal::Type::Enum

          AWS_ROLE = :aws_role
          SERVICE_ACCOUNT = :service_account

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsAWSRoleExecutionIdentity, Anthropic::Models::Beta::BetaManagedAgentsServiceAccountExecutionIdentity)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsExecutionIdentity::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :role_arn The IAM role's ARN.
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsAWSRoleExecutionIdentity, Anthropic::Models::Beta::BetaManagedAgentsServiceAccountExecutionIdentity]
        def self.new(type:, **args)
          case type.to_sym
          when :aws_role
            Anthropic::Beta::BetaManagedAgentsAWSRoleExecutionIdentity.new(**args)
          when :service_account
            Anthropic::Beta::BetaManagedAgentsServiceAccountExecutionIdentity.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsExecutionIdentity = Beta::BetaManagedAgentsExecutionIdentity
  end
end
