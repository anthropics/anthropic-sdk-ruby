# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsInjectionLocationResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationResponse,
                Anthropic::Internal::AnyHash
              )
            end

          # Whether the placeholder is substituted in the request body.
          sig { returns(T::Boolean) }
          attr_accessor :body

          # Whether the placeholder is substituted in request header values.
          sig { returns(T::Boolean) }
          attr_accessor :header

          # Where in the outbound request the secret value is substituted.
          sig do
            params(body: T::Boolean, header: T::Boolean).returns(
              T.attached_class
            )
          end
          def self.new(
            # Whether the placeholder is substituted in the request body.
            body:,
            # Whether the placeholder is substituted in request header values.
            header:
          )
          end

          sig { override.returns({ body: T::Boolean, header: T::Boolean }) }
          def to_hash
          end
        end
      end
    end
  end
end
