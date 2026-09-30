# frozen_string_literal: true

module Anthropic
  module Resources
    class Organization
      # @return [Anthropic::Resources::Organization::APIKeys]
      attr_reader :api_keys

      # @return [Anthropic::Resources::Organization::ExternalKeys]
      attr_reader :external_keys

      # @return [Anthropic::Resources::Organization::Federation]
      attr_reader :federation

      # @return [Anthropic::Resources::Organization::Invites]
      attr_reader :invites

      # @return [Anthropic::Resources::Organization::ServiceAccounts]
      attr_reader :service_accounts

      # @return [Anthropic::Resources::Organization::Users]
      attr_reader :users

      # @return [Anthropic::Resources::Organization::Workspaces]
      attr_reader :workspaces

      # @return [Anthropic::Resources::Organization::RateLimits]
      attr_reader :rate_limits

      # @return [Anthropic::Resources::Organization::ComplianceSettings]
      attr_reader :compliance_settings

      # Retrieve information about the organization associated with the authenticated
      # API key.
      #
      # @overload retrieve(request_options: {})
      #
      # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Anthropic::Models::OrganizationInfo]
      #
      # @see Anthropic::Models::OrganizationRetrieveParams
      def retrieve(params = {})
        @client.request(
          method: :get,
          path: "v1/organizations/me",
          model: Anthropic::OrganizationInfo,
          options: params[:request_options]
        )
      end

      # @api private
      #
      # @param client [Anthropic::Client]
      def initialize(client:)
        @client = client
        @api_keys = Anthropic::Resources::Organization::APIKeys.new(client: client)
        @external_keys = Anthropic::Resources::Organization::ExternalKeys.new(client: client)
        @federation = Anthropic::Resources::Organization::Federation.new(client: client)
        @invites = Anthropic::Resources::Organization::Invites.new(client: client)
        @service_accounts = Anthropic::Resources::Organization::ServiceAccounts.new(client: client)
        @users = Anthropic::Resources::Organization::Users.new(client: client)
        @workspaces = Anthropic::Resources::Organization::Workspaces.new(client: client)
        @rate_limits = Anthropic::Resources::Organization::RateLimits.new(client: client)
        @compliance_settings = Anthropic::Resources::Organization::ComplianceSettings.new(client: client)
      end
    end
  end
end
