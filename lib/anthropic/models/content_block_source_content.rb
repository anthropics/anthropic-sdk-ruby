# frozen_string_literal: true

module Anthropic
  module Models
    module ContentBlockSourceContent
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :text, -> { Anthropic::TextBlockParam }

      variant :image, -> { Anthropic::ImageBlockParam }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)]
    end
  end
end
