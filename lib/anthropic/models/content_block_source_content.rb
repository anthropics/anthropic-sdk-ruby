# frozen_string_literal: true

module Anthropic
  module Models
    # @abstract
    class ContentBlockSourceContent < Anthropic::Union
      discriminator :type

      variant :text, -> { Anthropic::Models::TextBlockParam }

      variant :image, -> { Anthropic::Models::ImageBlockParam }

      # @!parse
      #   class << self
      #     # @return [Array(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)]
      #     def variants; end
      #   end
    end
  end
end
