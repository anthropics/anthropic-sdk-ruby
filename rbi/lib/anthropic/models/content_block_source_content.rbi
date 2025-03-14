# typed: strong

module Anthropic
  module Models
    class ContentBlockSourceContent < Anthropic::Union
      abstract!

      class << self
        # @api private
        sig do
          override
            .returns([[Symbol, Anthropic::Models::TextBlockParam], [Symbol, Anthropic::Models::ImageBlockParam]])
        end
        private def variants
        end
      end
    end
  end
end
