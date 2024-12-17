# frozen_string_literal: true

module Anthropic
  # @private
  #
  class BasePage
    # rubocop:disable Lint/UnusedMethodArgument

    # @private
    #
    # @param client [Anthropic::Client]
    # @param req [Hash{Symbol => Object}]
    # @param opts [Hash{Symbol => Object}]
    # @param headers [Hash{String => String}]
    # @param unwrapped [Object]
    def initialize(client:, req:, opts:, headers:, unwrapped:)
      @client = client
      @req = req
      @opts = opts
    end

    # @return [Boolean]
    def next_page? = (raise NotImplementedError)

    # @raise [Anthropic::HTTP::Error]
    # @return [Anthropic::Page]
    def next_page = (raise NotImplementedError)

    # @param blk [Proc]
    #
    # @yieldparam [Object]
    # @return [void]
    def auto_paging_each(&blk) = (raise NotImplementedError)

    # @return [Enumerator]
    def to_enum = super(:auto_paging_each)

    alias_method :enum_for, :to_enum

    # rubocop:enable Lint/UnusedMethodArgument
  end
end
