# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsMCPOAuthRefreshUpdateParams < Anthropic::Internal::Type::BaseModel
          # @!attribute refresh_token
          #   The new OAuth refresh token to replace the stored one.
          #
          #   @return [String, nil]
          optional :refresh_token, String, nil?: true

          # @!attribute scope
          #   The new OAuth scope for refresh requests. Send an empty string to clear the
          #   stored scope.
          #
          #   @return [String, nil]
          optional :scope, String, nil?: true

          # @!attribute token_endpoint_auth
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam, nil]
          optional :token_endpoint_auth,
                   union: -> { Anthropic::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams::TokenEndpointAuth }

          # @!method initialize(refresh_token: nil, scope: nil, token_endpoint_auth: nil)
          #   Parameters for updating OAuth refresh token configuration.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams}
          #   for more details.
          #
          #   @param refresh_token [String, nil] The new OAuth refresh token to replace the stored one.
          #
          #   @param scope [String, nil] The new OAuth scope for refresh requests. Send an empty string to clear the stor
          #
          #   @param token_endpoint_auth [Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam]

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams#token_endpoint_auth
          module TokenEndpointAuth
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # Updated HTTP Basic authentication parameters for the token endpoint.
            variant :client_secret_basic,
                    -> { Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam }

            # Updated POST body authentication parameters for the token endpoint.
            variant :client_secret_post,
                    -> { Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam }

            module Type
              extend Anthropic::Internal::Type::Enum

              CLIENT_SECRET_BASIC = :client_secret_basic
              CLIENT_SECRET_POST = :client_secret_post

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams::TokenEndpointAuth}
            # for more details.
            #
            # @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsMCPOAuthRefreshUpdateParams::TokenEndpointAuth::Type, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String, nil] :client_secret A new OAuth client secret to replace the stored one.
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam, Anthropic::Models::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam]
            def self.new(type:, **args)
              case type.to_sym
              when :client_secret_basic
                Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam.new(**args)
              when :client_secret_post
                Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostUpdateParam.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end
        end
      end
    end
  end
end
