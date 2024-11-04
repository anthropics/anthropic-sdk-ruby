# frozen_string_literal: true

module Anthropic
  class Page
    # @return [Array<Object>]
    attr_accessor :data

    # @return [Boolean]
    attr_accessor :has_more

    # @return [String]
    attr_accessor :first_id

    # @return [String]
    attr_accessor :last_id

    # @!visibility private
    #
    # @return [Anthropic::Client]
    attr_accessor :client

    # @!visibility private
    #
    # @return [Hash{Symbol => Object}]
    attr_accessor :req

    # @!visibility private
    #
    # @return [Hash{Symbol => Object}]
    attr_accessor :opts

    # @!visibility private
    #
    # @param model [Object]
    # @param raw_data [Hash{Symbol => Object}]
    # @param response [Net::HTTPResponse]
    # @param client [Anthropic::Client]
    # @param req [Hash{Symbol => Object}]
    # @param opts [Hash{Symbol => Object}]
    def initialize(model, raw_data, _response, client, req, opts)
      self.data = (raw_data[:data] || []).map { |e| model.convert(e) }
      self.has_more = raw_data[:has_more]
      self.first_id = raw_data[:first_id]
      self.last_id = raw_data[:last_id]
      self.client = client
      self.req = req
      self.opts = opts
    end

    # @return [Boolean]
    def next_page?
      !last_id.nil?
    end

    # @raise [Anthropic::HTTP::Error]
    # @return [Anthropic::Page]
    def next_page
      unless next_page?
        raise "No more pages available; please check #next_page? before calling #next_page"
      end
      client.request(Anthropic::Util.deep_merge(req, {query: {after_id: last_id}}), opts)
    end

    # @param blk [Proc]
    #
    # @return [nil]
    def auto_paging_each(&blk)
      unless block_given?
        raise "A block must be given to #auto_paging_each"
      end
      page = self
      loop do
        page.data.each { |e| blk.call(e) }
        break unless page.next_page?
        page = page.next_page
      end
    end

    # @return [String]
    def inspect
      "#<#{selfl.class}:0x#{object_id.to_s(16)} data=#{data.inspect} has_more=#{has_more.inspect} first_id=#{first_id.inspect} last_id=#{last_id.inspect}>"
    end
  end
end
