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

        sig { returns(Symbol) }
        attr_accessor :type

        # A referenced resource no longer exists and its kind was not reported.
        sig { params(message: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # Human-readable error description.
          message:,
          type: :session_resource_not_found_error
        )
        end

        sig { override.returns({ message: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
