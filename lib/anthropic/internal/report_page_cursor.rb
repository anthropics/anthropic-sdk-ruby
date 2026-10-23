# frozen_string_literal: true

module Anthropic
  module Internal
    # @generic Elem
    #
    # @example
    #   if report_page_cursor.has_next?
    #     report_page_cursor = report_page_cursor.next_page
    #   end
    #
    # @example
    #   report_page_cursor.auto_paging_each do |usage|
    #     puts(usage)
    #   end
    class ReportPageCursor
      include Anthropic::Internal::Type::BasePage

      # @return [Array<generic<Elem>>, nil]
      attr_accessor :data

      # @return [String, nil]
      attr_accessor :next_page_

      # @return [Boolean]
      attr_accessor :has_more

      # @return [Time, nil]
      attr_accessor :data_refreshed_at

      # @return [Boolean]
      def next_page?
        return false if has_more == false

        !next_page_.to_s.empty?
      end

      # @raise [Anthropic::HTTP::Error]
      # @return [self]
      def next_page
        unless next_page?
          message = "No more pages available. Please check #next_page? before calling ##{__method__}"
          raise RuntimeError.new(message)
        end

        req = Anthropic::Internal::Util.deep_merge(@req, {query: {page: next_page_}})
        @client.request(req)
      end

      # @param blk [Proc]
      #
      # @yieldparam [generic<Elem>]
      def auto_paging_each(&blk)
        unless block_given?
          raise ArgumentError.new("A block must be given to ##{__method__}")
        end

        page = self
        loop do
          page.data&.each(&blk)

          break unless page.next_page?
          page = page.next_page
        end
      end

      # @api private
      #
      # @param client [Anthropic::Internal::Transport::BaseClient]
      # @param req [Hash{Symbol=>Object}]
      # @param headers [Hash{String=>String}]
      # @param page_data [Hash{Symbol=>Object}]
      def initialize(client:, req:, headers:, page_data:)
        super

        case page_data
        in {data: Array => data}
          @data = data.map { Anthropic::Internal::Type::Converter.coerce(@model, _1) }
        else
        end
        @next_page_ = page_data[:next_page]
        @has_more = page_data[:has_more]
        @data_refreshed_at = Anthropic::Internal::Type::Converter.coerce(Time, page_data[:data_refreshed_at])
      end

      # @api private
      #
      # @return [String]
      def inspect
        # rubocop:disable Layout/LineLength
        model = Anthropic::Internal::Type::Converter.inspect(@model, depth: 1)

        "#<#{self.class}[#{model}]:0x#{object_id.to_s(16)} next_page_=#{next_page_.inspect} has_more=#{has_more.inspect} data_refreshed_at=#{data_refreshed_at.inspect}>"
        # rubocop:enable Layout/LineLength
      end
    end
  end
end
