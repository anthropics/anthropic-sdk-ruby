# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsRefreshHTTPResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsRefreshHTTPResponse,
                Anthropic::Internal::AnyHash
              )
            end

          # Response body. May be truncated and has sensitive values scrubbed.
          sig { returns(String) }
          attr_accessor :body

          # Whether `body` was truncated.
          sig { returns(T::Boolean) }
          attr_accessor :body_truncated

          # Value of the `Content-Type` response header.
          sig { returns(String) }
          attr_accessor :content_type

          # HTTP status code.
          sig { returns(Integer) }
          attr_accessor :status_code

          # An HTTP response captured during a credential validation probe.
          sig do
            params(
              body: String,
              body_truncated: T::Boolean,
              content_type: String,
              status_code: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Response body. May be truncated and has sensitive values scrubbed.
            body:,
            # Whether `body` was truncated.
            body_truncated:,
            # Value of the `Content-Type` response header.
            content_type:,
            # HTTP status code.
            status_code:
          )
          end

          sig do
            override.returns(
              {
                body: String,
                body_truncated: T::Boolean,
                content_type: String,
                status_code: Integer
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
