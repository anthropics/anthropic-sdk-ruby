# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolResultBlockParam < Anthropic::BaseModel
        # @!attribute tool_use_id
        #
        #   @return [String]
        required :tool_use_id, String

        # @!attribute type
        #
        #   @return [Symbol, :tool_result]
        required :type, const: :tool_result

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute [r] content
        #
        #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam>, nil]
        optional :content, union: -> { Anthropic::Models::Beta::BetaToolResultBlockParam::Content }

        # @!parse
        #   # @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam>]
        #   attr_writer :content

        # @!attribute [r] is_error
        #
        #   @return [Boolean, nil]
        optional :is_error, Anthropic::BooleanModel

        # @!parse
        #   # @return [Boolean]
        #   attr_writer :is_error

        # @!parse
        #   # @param tool_use_id [String]
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   # @param content [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam>]
        #   # @param is_error [Boolean]
        #   # @param type [Symbol, :tool_result]
        #   #
        #   def initialize(tool_use_id:, cache_control: nil, content: nil, is_error: nil, type: :tool_result, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @see Anthropic::Models::Beta::BetaToolResultBlockParam#content
        module Content
          extend Anthropic::Union

          variant String

          variant -> { Anthropic::Models::Beta::BetaToolResultBlockParam::Content::ContentArray }

          module Content
            extend Anthropic::Union

            discriminator :type

            variant :text, -> { Anthropic::Models::Beta::BetaTextBlockParam }

            variant :image, -> { Anthropic::Models::Beta::BetaImageBlockParam }

            # @!parse
            #   # @return [Array(Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam)]
            #   def self.variants; end
          end

          # @!parse
          #   # @return [Array(String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam>)]
          #   def self.variants; end

          ContentArray =
            Anthropic::ArrayOf[union: -> { Anthropic::Models::Beta::BetaToolResultBlockParam::Content::Content }]
        end
      end
    end

    BetaToolResultBlockParam = Beta::BetaToolResultBlockParam
  end
end
