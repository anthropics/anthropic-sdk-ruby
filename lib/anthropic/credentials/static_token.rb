# frozen_string_literal: true

module Anthropic
  module Credentials
    # An access token provider that always returns a fixed token with no expiry.
    #
    # This is the simplest credential provider, suitable for static API keys
    # or tokens that don't expire. It implements the access token provider
    # protocol by responding to +call+ with an {AccessToken}.
    class StaticToken
      # @param token [String] the fixed token to return on every call
      def initialize(token)
        @token = token
      end

      # Returns an {AccessToken} with the fixed token and no expiry.
      #
      # @param force_refresh [Boolean] ignored; static tokens have no cache to bypass
      # @return [AccessToken] the access token with +expires_at: nil+
      def call(force_refresh: false) # rubocop:disable Lint/UnusedMethodArgument
        AccessToken.new(token: @token, expires_at: nil)
      end
    end
  end
end
