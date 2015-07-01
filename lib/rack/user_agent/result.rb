module Rack
  class UserAgent
    module Result
      def device_type
        return :UNKNOWN if woothee_result[:category] == Woothee::VALUE_UNKNOWN
        woothee_result[:category]
      end

      def os
        woothee_result[:os]
      end

      def os_version
        woothee_result[:os_version]
      end

      def browser
        woothee_result[:name]
      end

      def browser_version
        woothee_result[:version]
      end

      def browser_vendor
        woothee_result[:vendor]
      end

      private

      def woothee_result
        env["rack.woothee"] || {}
      end
    end
  end
end
