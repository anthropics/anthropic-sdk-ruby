# typed: strong

module Anthropic
  module Models
    class ContentBlockSourceContent < Anthropic::Union
      abstract!

      class << self
        sig { override.returns([Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam]) }
        def variants
        end
      end
    end
  end
end
