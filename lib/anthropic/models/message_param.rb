# frozen_string_literal: true

module Anthropic
  module Models
    class MessageParam < Anthropic::BaseModel
      # @!attribute content
      #
      #   @return [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::DocumentBlockParam>]
      required :content, union: -> { Anthropic::Models::MessageParam::Content }

      # @!attribute role
      #
      #   @return [Symbol, Anthropic::Models::MessageParam::Role]
      required :role, enum: -> { Anthropic::Models::MessageParam::Role }

      # @!parse
      #   # @param content [String, Array<Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam, Anthropic::Models::ToolUseBlockParam, Anthropic::Models::ToolResultBlockParam, Anthropic::Models::DocumentBlockParam>]
      #   # @param role [String]
      #   #
      #   def initialize(content:, role:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case union
      # in String
      #   # ...
      # in Anthropic::Models::MessageParam::Content::ContentBlockParamArray
      #   # ...
      # end
      # ```
      class Content < Anthropic::Union
        ContentBlockParamArray = Anthropic::ArrayOf[union: -> { Anthropic::Models::ContentBlockParam }]

        variant String

        variant -> { Anthropic::Models::MessageParam::Content::ContentBlockParamArray }
      end

      # @example
      #
      # ```ruby
      # case enum
      # in :user
      #   # ...
      # in :assistant
      #   # ...
      # end
      # ```
      class Role < Anthropic::Enum
        USER = :user
        ASSISTANT = :assistant

        finalize!
      end
    end
  end
end
