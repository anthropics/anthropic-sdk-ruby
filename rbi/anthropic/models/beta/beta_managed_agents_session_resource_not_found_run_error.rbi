# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSessionResourceNotFoundRunError =
      Beta::BetaManagedAgentsSessionResourceNotFoundRunError

    module Beta
      class BetaManagedAgentsSessionResourceNotFoundRunError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundRunError,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable error description.
        sig { returns(String) }
        attr_accessor :message

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundRunError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # A referenced resource no longer exists and its kind was not reported.
        sig do
          params(
            message: String,
            type:
              Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundRunError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Human-readable error description.
          message:,
          type:
        )
        end

        sig do
          override.returns(
            {
              message: String,
              type:
                Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundRunError::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundRunError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SESSION_RESOURCE_NOT_FOUND_ERROR =
            T.let(
              :session_resource_not_found_error,
              Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundRunError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundRunError::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
