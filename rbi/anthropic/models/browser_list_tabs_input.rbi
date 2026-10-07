# typed: strong

module Anthropic
  module Models
    class BrowserListTabsInput < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::BrowserListTabsInput, Anthropic::Internal::AnyHash)
        end

      # List all open tabs with each tab's tab_id, title, and URL.
      sig { returns(T.attached_class) }
      def self.new
      end

      sig { override.returns({}) }
      def to_hash
      end
    end
  end
end
