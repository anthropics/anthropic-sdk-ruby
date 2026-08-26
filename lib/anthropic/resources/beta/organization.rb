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
        end
      end
    end
  end
end
