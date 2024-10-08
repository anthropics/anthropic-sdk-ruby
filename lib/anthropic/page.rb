# frozen_string_literal: true

module Anthropic
  class Page
    # @return [Array]
    attr_accessor :data

    # @return [Boolean]
    attr_accessor :has_more

    # @return [String]
    attr_accessor :first_id

    # @return [String]
    attr_accessor :last_id

    # @!visibility private
    attr_accessor :client, :req, :opts

    # @!visibility private
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

    # @return [Page]
    def next_page
      if !next_page?
        raise "No more pages available; please check #next_page? before calling #next_page"
      end
      client.request(Util.deep_merge(req, {query: {after_id: last_id}}), opts)
    end

    # @return [nil]
    def auto_paging_each(&blk)
      if !blk
        raise "A block must be given to #auto_paging_each"
      end
      page = self
      loop do
        page.data.each { |e| blk.call(e) }
        break if !page.next_page?
        page = page.next_page
      end
    end
  end
end
