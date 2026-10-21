# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSystemContentBlock =
      Beta::BetaManagedAgentsSystemContentBlock

    module Beta
      class BetaManagedAgentsSystemContentBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSystemContentBlock,
              Anthropic::Internal::AnyHash
            )
          end

        # The text content.
        sig { returns(String) }
        attr_accessor :text

        sig { returns(Symbol) }
        attr_accessor :type

        # Content block in a mid-conversation system message. Text-only.
        sig { params(text: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # The text content.
          text:,
          type: :text
        )
        end

        sig { override.returns({ text: String, type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
