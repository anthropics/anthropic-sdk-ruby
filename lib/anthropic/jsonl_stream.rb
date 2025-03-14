# frozen_string_literal: true

module Anthropic
  # @api private
  #
  # @example
  # ```ruby
  # stream.for_each do |completion|
  #   puts(completion)
  # end
  # ```
  #
  # @example
  # ```ruby
  # completions = stream.to_enum.take(2)
  #
  # completions => Array
  # ```
  class JsonLStream
    include Anthropic::BaseStream

    # @api private
    #
    # @return [Enumerable]
    private def iterator
      @iterator ||= Anthropic::Util.chain_fused(@messages) do |y|
        @messages.each do
          y << Anthropic::Converter.coerce(@model, _1)
        end
      end
    end
  end
end
