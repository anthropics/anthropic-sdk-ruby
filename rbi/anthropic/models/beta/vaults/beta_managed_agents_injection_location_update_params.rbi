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

          # Updated injection location.
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
