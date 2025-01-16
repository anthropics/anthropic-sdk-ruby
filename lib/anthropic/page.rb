# frozen_string_literal: true

module Anthropic
  # @example
  # ```ruby
  # if page.has_next?
  #   page = page.next_page
  # end
  # ```
  #
  # @example
  # ```ruby
  # page.auto_paging_each do |item|
  # #   item ...
  # end
  # ```
  #
  # @example
  # ```ruby
  # items = page.to_enum.take(2)
  #
  # items => Array
  # ```
  class Page < Anthropic::BasePage
    # @return [Array<Object>]
    attr_accessor :data

    # @return [Boolean]
    attr_accessor :has_more

    # @return [String, nil]
    attr_accessor :first_id

    # @return [String, nil]
    attr_accessor :last_id

    # @private
    #
    # @param client [Anthropic::BaseClient]
    # @param req [Hash{Symbol=>Object}]
    # @param opts [Hash{Symbol=>Object}]
    # @param headers [Hash{String=>String}]
    # @param unwrapped [Hash{Symbol=>Object}]
    #
    def initialize(client:, req:, opts:, headers:, unwrapped:)
      model = req.fetch(:model)

      case unwrapped
      in {data: data} if data.is_a?(Array) || data.nil?
        @data = data&.map { |row| model.coerce(row) }
      else
      end

      case unwrapped
      in {has_more: has_more}
        @has_more = has_more
      else
      end

      case unwrapped
      in {first_id: first_id} if first_id.is_a?(String) || first_id.is_nil?
        @first_id = first_id
      else
      end

      case unwrapped
      in {last_id: last_id} if last_id.is_a?(String) || last_id.is_nil?
        @last_id = last_id
      else
      end

      super
    end

    # @return [Boolean]
    #
    def next_page?
      !last_id.nil?
    end

    # @raise [Anthropic::HTTP::Error]
    # @return [Anthropic::Page]
    #
    def next_page
      unless next_page?
        raise "No more pages available; please check #next_page? before calling #next_page"
      end

      req = Anthropic::Util.deep_merge(@req, {query: {after_id: last_id}})
      @client.request(req, @opts)
    end

    # @param blk [Proc]
    #
    def auto_paging_each(&blk)
      unless block_given?
        raise ArgumentError.new("A block must be given to #auto_paging_each")
      end
      page = self
      loop do
        page.data&.each { |row| blk.call(row) }
        break unless page.next_page?
        page = page.next_page
      end
    end

    # @return [String]
    #
    def inspect
      "#<#{self.class}:0x#{object_id.to_s(16)} data=#{data.inspect} has_more=#{has_more.inspect} first_id=#{first_id.inspect} last_id=#{last_id.inspect}>"
    end
  end
end
