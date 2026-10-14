# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Execution principal for runs of this agent: `service_account` (the default) or
      # `aws_role`.
      module BetaManagedAgentsExecutionIdentityParams
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # An AWS IAM role principal.
        variant :aws_role, -> { Anthropic::Beta::BetaManagedAgentsAWSRoleExecutionIdentityParams }

        # The Anthropic-managed service account — the default execution principal. Carries no identifier.
        variant :service_account, -> { Anthropic::Beta::BetaManagedAgentsServiceAccountExecutionIdentityParams }

        module Type
          extend Anthropic::Internal::Type::Enum

          AWS_ROLE = :aws_role
          SERVICE_ACCOUNT = :service_account

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsAWSRoleExecutionIdentityParams, Anthropic::Models::Beta::BetaManagedAgentsServiceAccountExecutionIdentityParams)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaManagedAgentsExecutionIdentityParams} for more
        # details.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsExecutionIdentityParams::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :role_arn The IAM role's ARN, e.g. "arn:aws:iam::123456789012:role/my-agent-runner". Maxim
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsAWSRoleExecutionIdentityParams, Anthropic::Models::Beta::BetaManagedAgentsServiceAccountExecutionIdentityParams]
        def self.new(type:, **args)
          case type.to_sym
          when :aws_role
            Anthropic::Beta::BetaManagedAgentsAWSRoleExecutionIdentityParams.new(**args)
          when :service_account
            Anthropic::Beta::BetaManagedAgentsServiceAccountExecutionIdentityParams.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsExecutionIdentityParams = Beta::BetaManagedAgentsExecutionIdentityParams
  end
end
