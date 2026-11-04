# typed: strong

module Anthropic
  module Models
    class AvailableToolsLimitExceededErrorDetails < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::AvailableToolsLimitExceededErrorDetails,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :error_code

      # The tools available after a message exceed a limit on their number or their
      # size.
      sig { params(error_code: Symbol).returns(T.attached_class) }
      def self.new(error_code: :available_tools_limit_exceeded)
      end

      sig { override.returns({ error_code: Symbol }) }
      def to_hash
      end
    end
  end
end
