# frozen_string_literal: true

module Anthropic
  module Models
    module ContentBlockSourceContent
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :text, -> { Anthropic::Models::TextBlockParam }

      variant :image, -> { Anthropic::Models::ImageBlockParam }

      # @!parse
      #   # @return [Array(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)]
      #   def self.variants; end
    end
  end
end
