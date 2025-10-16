# frozen_string_literal: true

module Anthropic
  module Internal
    # @generic Elem
    #
    # @example
    #   if page_cursor.has_next?
    #     page_cursor = page_cursor.next_page
    #   end
    #
    # @example
    #   page_cursor.auto_paging_each do |skill|
    #     puts(skill)
    #   end
    class PageCursor
      include Anthropic::Internal::Type::BasePage

      # @return [Array<generic<Elem>>, nil]
      attr_accessor :data

      # @return [Boolean]
      attr_accessor :has_more

      # @return [String, nil]
      attr_accessor :next_page_

      # @return [Boolean]
      def next_page?
        has_more
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
        @has_more = page_data[:has_more]
        @next_page_ = page_data[:next_page]
      end

      # @api private
      #
      # @return [String]
      def inspect
        # rubocop:disable Layout/LineLength
        model = Anthropic::Internal::Type::Converter.inspect(@model, depth: 1)

        "#<#{self.class}[#{model}]:0x#{object_id.to_s(16)} has_more=#{has_more.inspect} next_page_=#{next_page_.inspect}>"
        # rubocop:enable Layout/LineLength
      end
    end
  end
end
