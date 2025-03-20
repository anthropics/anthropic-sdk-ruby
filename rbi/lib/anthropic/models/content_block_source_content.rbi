# typed: strong

module Anthropic
  module Models
    module ContentBlockSourceContent
      extend Anthropic::Union

      Variants =
        type_template(:out) { {fixed: T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)} }

      class << self
        sig { override.returns([Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam]) }
        def variants
        end
      end
    end
  end
end
