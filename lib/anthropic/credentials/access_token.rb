# frozen_string_literal: true

module Anthropic
  module Credentials
    # An Anthropic API access token with optional expiry.
    #
    # This is a frozen value object representing an access token and its
    # expiration time. The +expires_at+ is a Unix timestamp in seconds;
    # +nil+ means no expiry information (the token will be treated as
    # never-expires by {TokenCache}).
    class AccessToken
      # @return [String] the access token string
      attr_reader :token

      # @return [Integer, nil] Unix timestamp in seconds when the token expires,
      #   or +nil+ if the token never expires
      attr_reader :expires_at

      # @param token [String] the access token string
      # @param expires_at [Integer, nil] Unix timestamp in seconds, or +nil+ for no expiry
      def initialize(token:, expires_at: nil)
        @token = token
        @expires_at = expires_at
        freeze
      end

      # @return [Integer] hash code for the token
      def hash
        [token, expires_at].hash
      end

      def ==(other)
        return false unless other.is_a?(AccessToken)
        token == other.token && expires_at == other.expires_at
      end

      alias_method :eql?, :==
    end
  end
end
