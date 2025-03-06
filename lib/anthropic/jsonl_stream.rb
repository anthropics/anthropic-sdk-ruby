# frozen_string_literal: true

module Anthropic
  # @private
  #
  class JsonLStream < Anthropic::BaseStream
    # @private
    #
    # @return [Enumerable]
    #
    private def iterator
      @iterator ||= Anthropic::Util.chain_fused(@messages) do |y|
        @messages.each do |line|
          decoded = JSON.parse(line, symbolize_names: true)
          y << Anthropic::Converter.coerce(@model, decoded)
        end
      end
    end
  end
end
