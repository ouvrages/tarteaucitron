module Tarteaucitron
  module ViewHelpers
    def tarteaucitron(options = {})
      result = ""
      ip = request.remote_ip
  #   ip = "109.190.53.206"
  #   ip = "207.97.227.239"
      if ["EU", "--"].include?(GeoIP.new(Rails.root.join('db', 'GeoIP.dat')).country(ip).continent_code)
        result += content_tag("script", '', src: "/tarteaucitron/tarteaucitron.js", type: "text/javascript")
        default = {
                    "hashtag"=> "#tarteaucitron",
                    "highPrivacy"=> false,
                    "orientation"=> "top",
                    "adblocker"=> false,
                    "showAlertSmall"=> true,
                    "cookieslist"=> true,
                    "removeCredit"=> false,
                  }
        script = "tarteaucitron.init(#{default.to_json});"
        if options.has_key?("google")
          script += "tarteaucitron.user.gajsUa = '#{options["google"]}';"
          script += "tarteaucitron.user.gajsMore = function () {};"
          script += "(tarteaucitron.job = tarteaucitron.job || []).push('gajs');"
        end

        if options.has_key?("facebook")
          script += "(tarteaucitron.job = tarteaucitron.job || []).push('facebook');"
        end

        result += content_tag("script", script.html_safe)

        result.html_safe
      end
    end

    def facebook(options = {})

      default_options = {layout: "standard", action: "like", share: "true"}
      options = default_options.merge(options)

      content_tag(:div, '', class: "fb-like", data: options).html_safe

    end    
  end
end
