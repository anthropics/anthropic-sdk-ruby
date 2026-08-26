# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        sig { returns(Anthropic::Resources::Beta::Organization::APIKeys) }
        attr_reader :api_keys

        sig { returns(Anthropic::Resources::Beta::Organization::ExternalKeys) }
        attr_reader :external_keys

        sig { returns(Anthropic::Resources::Beta::Organization::Federation) }
        attr_reader :federation

        sig { returns(Anthropic::Resources::Beta::Organization::Invites) }
        attr_reader :invites

        sig do
          returns(Anthropic::Resources::Beta::Organization::ServiceAccounts)
        end
        attr_reader :service_accounts

        sig { returns(Anthropic::Resources::Beta::Organization::Users) }
        attr_reader :users

        sig { returns(Anthropic::Resources::Beta::Organization::Workspaces) }
        attr_reader :workspaces

        sig { returns(Anthropic::Resources::Beta::Organization::RateLimits) }
        attr_reader :rate_limits

        # Retrieve information about the organization associated with the authenticated
        # API key.
        sig do
          params(request_options: Anthropic::RequestOptions::OrHash).returns(
            Anthropic::Beta::BetaOrganization
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
end
