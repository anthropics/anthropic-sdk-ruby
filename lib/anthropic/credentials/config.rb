# frozen_string_literal: true

require "pathname"
require "uri"

module Anthropic
  module Config
    class << self
      def config_file_path(profile)
        validate_profile_name!(profile)
        Anthropic::Credentials.config_file_path(profile)
      end

      def credentials_file_path(profile)
        validate_profile_name!(profile)
        Anthropic::Credentials.config_dir.join("credentials", "#{profile}.json")
      end

      def active_profile
        profile = Anthropic::Credentials.active_profile
        validate_profile_name!(profile)
        profile
      end

      def active_profile_config?
        config_file_path(active_profile).file?
      rescue Anthropic::Errors::ConfigurationError
        false
      end

      def validate_profile_name!(profile, source: "profile name")
        if profile.nil? || profile.empty?
          raise Anthropic::Errors::ConfigurationError,
                "#{source} must not be empty"
        end
        if profile != profile.strip
          raise Anthropic::Errors::ConfigurationError,
                "#{source} '#{profile}' has leading/trailing whitespace"
        end
        if profile.start_with?(".")
          raise Anthropic::Errors::ConfigurationError,
                "#{source} '#{profile}' must not start with a dot"
        end

        ["/", "\\", File::SEPARATOR].each do |sep|
          next if sep.empty?
          if profile.include?(sep)
            raise Anthropic::Errors::ConfigurationError,
                  "#{source} '#{profile}' must not contain path separators"
          end
        end

        return unless profile.include?("\x00")
        raise Anthropic::Errors::ConfigurationError, "#{source} '#{profile}' must not contain null bytes"
      end

      def require_https!(url, field:)
        begin
          uri = URI.parse(url.to_s)
        rescue URI::InvalidURIError
          raise Anthropic::Errors::ConfigurationError,
                "#{field} is not a valid URL (got '#{url}')"
        end

        return if uri.scheme == "https"
        return if uri.scheme == "http" && %w[localhost 127.0.0.1 ::1].include?(uri.hostname)

        raise Anthropic::Errors::ConfigurationError,
              "#{field} must use https (got '#{url}'); the token-exchange endpoint " \
              "carries secret material and cannot be used over cleartext HTTP."
      end
    end
  end
end
