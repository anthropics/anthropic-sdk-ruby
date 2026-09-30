# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        # @return [Anthropic::Resources::Beta::Organization::APIKeys]
        attr_reader :api_keys

        # @return [Anthropic::Resources::Beta::Organization::ExternalKeys]
        attr_reader :external_keys

        # @return [Anthropic::Resources::Beta::Organization::Federation]
        attr_reader :federation

        # @return [Anthropic::Resources::Beta::Organization::Invites]
        attr_reader :invites

        # @return [Anthropic::Resources::Beta::Organization::ServiceAccounts]
        attr_reader :service_accounts

        # @return [Anthropic::Resources::Beta::Organization::Users]
        attr_reader :users

        # @return [Anthropic::Resources::Beta::Organization::Workspaces]
        attr_reader :workspaces

        # @return [Anthropic::Resources::Beta::Organization::RateLimits]
        attr_reader :rate_limits

        # @return [Anthropic::Resources::Beta::Organization::ComplianceSettings]
        attr_reader :compliance_settings

        # @return [Anthropic::Resources::Beta::Organization::Analytics]
        attr_reader :analytics

        # @return [Anthropic::Resources::Beta::Organization::SpendLimits]
        attr_reader :spend_limits

        # @return [Anthropic::Resources::Beta::Organization::RBACGroups]
        attr_reader :rbac_groups

        # @return [Anthropic::Resources::Beta::Organization::RBACRoles]
        attr_reader :rbac_roles

        # @return [Anthropic::Resources::Beta::Organization::Plugins]
        attr_reader :plugins

        # @return [Anthropic::Resources::Beta::Organization::PluginMarketplaces]
        attr_reader :plugin_marketplaces

        # Retrieve information about the organization associated with the authenticated
        # API key.
        #
        # @overload retrieve(request_options: {})
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaOrganization]
        #
        # @see Anthropic::Models::Beta::OrganizationRetrieveParams
        def retrieve(params = {})
          @client.request(
            method: :get,
            path: "v1/organizations/me?beta=true",
            model: Anthropic::Beta::BetaOrganization,
            options: params[:request_options]
          )
        end

        # @api private
        #
        # @param client [Anthropic::Client]
        def initialize(client:)
          @client = client
          @api_keys = Anthropic::Resources::Beta::Organization::APIKeys.new(client: client)
          @external_keys = Anthropic::Resources::Beta::Organization::ExternalKeys.new(client: client)
          @federation = Anthropic::Resources::Beta::Organization::Federation.new(client: client)
          @invites = Anthropic::Resources::Beta::Organization::Invites.new(client: client)
          @service_accounts = Anthropic::Resources::Beta::Organization::ServiceAccounts.new(client: client)
          @users = Anthropic::Resources::Beta::Organization::Users.new(client: client)
          @workspaces = Anthropic::Resources::Beta::Organization::Workspaces.new(client: client)
          @rate_limits = Anthropic::Resources::Beta::Organization::RateLimits.new(client: client)
          @compliance_settings = Anthropic::Resources::Beta::Organization::ComplianceSettings.new(client: client)
          @analytics = Anthropic::Resources::Beta::Organization::Analytics.new(client: client)
          @spend_limits = Anthropic::Resources::Beta::Organization::SpendLimits.new(client: client)
          @rbac_groups = Anthropic::Resources::Beta::Organization::RBACGroups.new(client: client)
          @rbac_roles = Anthropic::Resources::Beta::Organization::RBACRoles.new(client: client)
          @plugins = Anthropic::Resources::Beta::Organization::Plugins.new(client: client)
          @plugin_marketplaces = Anthropic::Resources::Beta::Organization::PluginMarketplaces.new(client: client)
        end
      end
    end
  end
end
