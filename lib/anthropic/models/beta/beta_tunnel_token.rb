# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Tunnels#reveal_token
      class BetaTunnelToken < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   Stable identifier for the current token value. Changes when the token is
        #   rotated.
        #
        #   @return [String]
        required :id, String

        # @!attribute tunnel_token
        #   The connector token used to run the tunnel. Treat as a credential.
        #
        #   @return [String]
        required :tunnel_token, String

        # @!attribute type
        #
        #   @return [Symbol, :tunnel_token]
        required :type, const: :tunnel_token

        # @!method initialize(id:, tunnel_token:, type: :tunnel_token)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaTunnelToken} for more details.
        #
        #   A tunnel's connector token.
        #
        #   @param id [String] Stable identifier for the current token value. Changes when the token is rotated
        #
        #   @param tunnel_token [String] The connector token used to run the tunnel. Treat as a credential.
        #
        #   @param type [Symbol, :tunnel_token]
      end
    end

    BetaTunnelToken = Beta::BetaTunnelToken
  end
end
