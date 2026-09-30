# typed: strong

module Anthropic
  module Resources
    class Organization
      sig { returns(Anthropic::Resources::Organization::APIKeys) }
      attr_reader :api_keys

      sig { returns(Anthropic::Resources::Organization::ExternalKeys) }
      attr_reader :external_keys

      sig { returns(Anthropic::Resources::Organization::Federation) }
      attr_reader :federation

      sig { returns(Anthropic::Resources::Organization::Invites) }
      attr_reader :invites

      sig { returns(Anthropic::Resources::Organization::ServiceAccounts) }
      attr_reader :service_accounts

      sig { returns(Anthropic::Resources::Organization::Users) }
      attr_reader :users

      sig { returns(Anthropic::Resources::Organization::Workspaces) }
      attr_reader :workspaces

      sig { returns(Anthropic::Resources::Organization::RateLimits) }
      attr_reader :rate_limits

      sig { returns(Anthropic::Resources::Organization::ComplianceSettings) }
      attr_reader :compliance_settings

      # Retrieve information about the organization associated with the authenticated
      # API key.
      sig do
        params(request_options: Anthropic::RequestOptions::OrHash).returns(
          Anthropic::OrganizationInfo
        )
      end
      def retrieve(request_options: {})
      end

      # @api private
      sig { params(client: Anthropic::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
