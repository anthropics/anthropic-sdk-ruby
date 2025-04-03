# typed: strong

module Anthropic
  module Models
    module ContentBlockSourceContent
      extend Anthropic::Internal::Type::Union

      sig { override.returns([Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam]) }
      def self.variants
      end
    end
  end
end
