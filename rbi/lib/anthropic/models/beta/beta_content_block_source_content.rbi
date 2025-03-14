# typed: strong

module Anthropic
  module Models
    BetaContentBlockSourceContent = T.type_alias { Beta::BetaContentBlockSourceContent }

    module Beta
      class BetaContentBlockSourceContent < Anthropic::Union
        abstract!

        class << self
          sig do
            override
              .returns([Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam])
          end
          def variants
          end
        end
      end
    end
  end
end
