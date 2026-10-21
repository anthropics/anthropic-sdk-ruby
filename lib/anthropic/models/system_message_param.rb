# frozen_string_literal: true

module Anthropic
  module Models
    class SystemMessageParam < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [String, Array<Anthropic::Models::TextBlockParam>]
      required :content, union: -> { Anthropic::SystemMessageParam::Content }

      # @!attribute role
      #
      #   @return [Symbol, :system]
      required :role, const: :system

      # @!method initialize(content:, role: :system)
      #   @param content [String, Array<Anthropic::Models::TextBlockParam>]
      #   @param role [Symbol, :system]

      # @see Anthropic::Models::SystemMessageParam#content
      module Content
        extend Anthropic::Internal::Type::Union

        variant String

        variant -> { Anthropic::Models::SystemMessageParam::Content::TextBlockParamArray }

        # @!method self.variants
        #   @return [Array(String, Array<Anthropic::Models::TextBlockParam>)]

        # @type [Anthropic::Internal::Type::Converter]
        TextBlockParamArray = Anthropic::Internal::Type::ArrayOf[-> { Anthropic::TextBlockParam }]
      end
    end
  end
end
