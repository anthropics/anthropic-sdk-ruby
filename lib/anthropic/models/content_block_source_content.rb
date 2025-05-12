# frozen_string_literal: true

module Anthropic
  module Models
    module ContentBlockSourceContent
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :text, -> { Anthropic::TextBlockParam }

      variant :image, -> { Anthropic::ImageBlockParam }

      # @!method self.variants
      #   @return [Array(Anthropic::TextBlockParam, Anthropic::ImageBlockParam)]

      define_sorbet_constant!(:Variants) do
        T.type_alias { T.any(Anthropic::TextBlockParam, Anthropic::ImageBlockParam) }
      end
    end
  end
end
