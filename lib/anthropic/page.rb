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
  class Page
    include Anthropic::BasePage

    # @return [Array<Object>]
    attr_accessor :data

    # @return [Boolean]
    attr_accessor :has_more

    # @return [String, nil]
    attr_accessor :first_id

    # @return [String, nil]
    attr_accessor :last_id

    # rubocop:disable Lint/UnusedMethodArgument
    # @private
    #
    # @param client [Anthropic::BaseClient]
    # @param req [Hash{Symbol=>Object}]
    # @param headers [Hash{String=>String}, Net::HTTPHeader]
    # @param page_data [Hash{Symbol=>Object}]
    #
    def initialize(client:, req:, headers:, page_data:)
      @client = client
      @req = req
      model = req.fetch(:model)

      case page_data
      in {data: Array | nil => data}
        @data = data&.map { model.coerce(_1) }
      else
      end

      case page_data
      in {has_more: has_more}
        @has_more = has_more
      else
      end

      case page_data
      in {first_id: String | nil => first_id}
        @first_id = first_id
      else
      end

      case page_data
      in {last_id: String | nil => last_id}
        @last_id = last_id
      else
      end
    end
    # rubocop:enable Lint/UnusedMethodArgument

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
        raise RuntimeError.new("No more pages available; please check #next_page? before calling #next_page")
      end

      req = Anthropic::Util.deep_merge(@req, {query: {after_id: last_id}})
      @client.request(req)
    end

    # @param blk [Proc]
    #
    def auto_paging_each(&blk)
      unless block_given?
        raise ArgumentError.new("A block must be given to #auto_paging_each")
      end
      page = self
      loop do
        page.data&.each { blk.call(_1) }
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
