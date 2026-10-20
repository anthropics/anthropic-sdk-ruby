# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsInjectionLocationUpdateParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Substitute when the placeholder appears in the request body.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :body

          sig { params(body: T::Boolean).void }
          attr_writer :body

          # Substitute when the placeholder appears in a request header value.
          sig { returns(T.nilable(T::Boolean)) }
          attr_reader :header

          sig { params(header: T::Boolean).void }
          attr_writer :header

          # Changes which parts of an outbound request the secret is substituted into. A
          # location you leave out keeps its current setting.
          #
          # After the change, at least one location must be enabled.
          #
          # See
          # [Authenticate with vaults](https://platform.claude.com/docs/en/managed-agents/vaults#add-a-credential)
          # to learn more about injection locations.
          sig do
            params(body: T::Boolean, header: T::Boolean).returns(
              T.attached_class
            )
          end
          def self.new(
            # Substitute when the placeholder appears in the request body.
            body: nil,
            # Substitute when the placeholder appears in a request header value.
            header: nil
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
