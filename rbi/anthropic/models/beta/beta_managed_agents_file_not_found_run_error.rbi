# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsFileNotFoundRunError =
      Beta::BetaManagedAgentsFileNotFoundRunError

    module Beta
      class BetaManagedAgentsFileNotFoundRunError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsFileNotFoundRunError,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable error description.
        sig { returns(String) }
        attr_accessor :message

        sig { returns(Symbol) }
        attr_accessor :type

        # A file resource referenced by the deployment no longer exists.
        sig { params(message: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # Human-readable error description.
          message:,
          type: :file_not_found_error
        )
        end

        sig { override.returns({ message: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
