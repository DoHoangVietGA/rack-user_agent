require "rack/user_agent/result"

# This module aims to provide APIs compatible with:
# https://github.com/ihara2525/rack-smartphone_detector
module Rack
  class UserAgent
    module Detector
      include Result

      def smartphone_version
        suppress_unknown(os_version)
      end

      def from_iphone?
        os == "iPhone"
      end

      def from_ipad?
        os == "iPad"
      end

      def from_android?
        os == "Android" && android_mobile?
      end

      def from_android_tablet?
        os == "Android" && !android_mobile?
      end

      def from_windows_phone?
        os == "Windows Phone OS"
      end

      private

      def android_mobile?
        (user_agent =~ /Android.+Mobi(le)?/).nil?.!
      end

      def suppress_unknown(version)
        if version == "UNKNOWN"
          nil
        else
          version
        end
      end
    end
  end
end
