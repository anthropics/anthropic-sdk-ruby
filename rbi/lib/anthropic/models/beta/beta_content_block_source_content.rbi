# typed: strong

module Anthropic
  module Models
    module Beta
      module BetaContentBlockSourceContent
        extend Anthropic::Union

        sig do
          override
            .returns([Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam])
        end
        def self.variants
        end
      end
    end

    BetaContentBlockSourceContent = Beta::BetaContentBlockSourceContent
  end
end
