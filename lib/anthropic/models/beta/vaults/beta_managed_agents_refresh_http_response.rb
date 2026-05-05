# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsRefreshHTTPResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute body
          #   Response body. May be truncated and has sensitive values scrubbed.
          #
          #   @return [String]
          required :body, String

          # @!attribute body_truncated
          #   Whether `body` was truncated.
          #
          #   @return [Boolean]
          required :body_truncated, Anthropic::Internal::Type::Boolean

          # @!attribute content_type
          #   Value of the `Content-Type` response header.
          #
          #   @return [String]
          required :content_type, String

          # @!attribute status_code
          #   HTTP status code.
          #
          #   @return [Integer]
          required :status_code, Integer

          # @!method initialize(body:, body_truncated:, content_type:, status_code:)
          #   An HTTP response captured during a credential validation probe.
          #
          #   @param body [String] Response body. May be truncated and has sensitive values scrubbed.
          #
          #   @param body_truncated [Boolean] Whether `body` was truncated.
          #
          #   @param content_type [String] Value of the `Content-Type` response header.
          #
          #   @param status_code [Integer] HTTP status code.
        end
      end
    end
  end
end
