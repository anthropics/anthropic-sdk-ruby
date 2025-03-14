# frozen_string_literal: true

module Anthropic
  # @example
  # ```ruby
  # stream.for_each do |batch|
  #   puts(batch)
  # end
  # ```
  #
  # @example
  # ```ruby
  # batches = stream
  #   .to_enum
  #   .lazy
  #   .select { _1.object_id.even? }
  #   .map(&:itself)
  #   .take(2)
  #   .to_a
  #
  # batches => Array
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
