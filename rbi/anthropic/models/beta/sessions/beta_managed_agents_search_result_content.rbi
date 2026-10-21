# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSearchResultContent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultContent,
                Anthropic::Internal::AnyHash
              )
            end

          # The text content.
          sig { returns(String) }
          attr_accessor :text

          sig { returns(Symbol) }
          attr_accessor :type

          # Text content within a search result.
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
end
