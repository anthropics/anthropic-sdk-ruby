# frozen_string_literal: true

module Anthropic
  module Credentials
    # An identity token provider that reads a JWT from a file on every call.
    #
    # Kubernetes projected service-account tokens (and similar) are rotated
    # in place, so the file MUST be re-read on every invocation rather than
    # cached. This provider is used as the +identity_token_provider+ argument
    # to {WorkloadIdentity}.
    class IdentityTokenFile
      # @return [Pathname] the resolved path to the identity token file
      attr_reader :path

      # @param path [String, nil] explicit path to the token file; if +nil+,
      #   falls back to +ANTHROPIC_IDENTITY_TOKEN_FILE+ environment variable
      # @raise [Anthropic::Errors::ConfigurationError] if no path is given and
      #   the environment variable is not set
      def initialize(path = nil)
        resolved = resolve_path(path)
        if resolved.nil?
          raise Anthropic::Errors::ConfigurationError,
                "No identity token file path given. Pass path or set #{Credentials::ENV_IDENTITY_TOKEN_FILE}"
        end
        @path = Pathname.new(resolved)
      end

      # Reads and returns the identity token from the file.
      #
      # The file is re-read on every call to handle token rotation.
      #
      # @return [String] the identity token (JWT) with leading/trailing whitespace stripped
      # @raise [Anthropic::Errors::ConfigurationError] if the file doesn't exist,
      #   is not readable, is a directory, or is empty
      def call
        content = @path.read.strip
        if content.empty?
          raise Anthropic::Errors::ConfigurationError,
                "Identity token file at #{@path} is empty"
        end
        content
      rescue Errno::ENOENT
        raise Anthropic::Errors::ConfigurationError,
              "Identity token file not found at #{@path}"
      rescue Errno::EACCES => e
        raise Anthropic::Errors::ConfigurationError,
              "Identity token file at #{@path} is not readable: #{e.message}"
      rescue Errno::EISDIR
        raise Anthropic::Errors::ConfigurationError,
              "Identity token path #{@path} is a directory, not a file"
      end

      private

      # @param explicit [String, nil] explicitly provided path
      # @return [String, nil] the resolved path or +nil+
      def resolve_path(explicit)
        return explicit if explicit

        env = ENV[Credentials::ENV_IDENTITY_TOKEN_FILE]
        env if env && !env.empty?
      end
    end
  end
end
