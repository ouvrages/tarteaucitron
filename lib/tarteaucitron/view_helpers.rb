module Tarteaucitron
  module ViewHelpers
    def tarteaucitron(options = {})
      options = options.with_indifferent_access
      result = ""
      ip = request.remote_ip
      if ["EU", "--"].include?(GeoIP.new(Rails.root.join('db', 'GeoIP.dat')).country(ip).continent_code)
        result += content_tag("script", '', src: "/tarteaucitron/tarteaucitron.js", type: "text/javascript")

        default = {
                    "hashtag"=> "#tarteaucitron",
                    "highPrivacy"=> false,
                    "orientation"=> options[:orientation] || "top",
                    "adblocker"=> false,
                    "showAlertSmall"=> true,
                    "cookieslist"=> true,
                    "removeCredit"=> false,
                  }

        init_options = default

        if options["options"]
          init_options = default.merge(options["options"].with_indifferent_access)
        end

        script = "tarteaucitron.init(#{init_options.to_json});"

        if options["google_optimize"]
          script += "tarteaucitron.user.optimizeUa = '#{options["google_optimize"]}';"
        end

        if options["google_analytics"]
          script += "tarteaucitron.user.gajsUa = '#{options["google_analytics"]}';"
          script += "tarteaucitron.user.gajsMore = function () {#{options["google_analytics_jsmore"]}};"
          script += "(tarteaucitron.job = tarteaucitron.job || []).push('gajs');"
        end

        if options["google_analytics_universal"]
          script += "tarteaucitron.user.analyticsUa = '#{options["google_analytics_universal"]}';"
          script += "tarteaucitron.user.analyticsMore = function () {#{options["google_analytics_jsmore"]}};"
          script += "(tarteaucitron.job = tarteaucitron.job || []).push('analytics');"
        end

        if options["gtag"]
          script += "tarteaucitron.user.gtagUa = '#{options["gtag"]}';"
          script += "tarteaucitron.user.gtagMore = function () {#{options["google_analytics_jsmore"]}};"
          script += "tarteaucitron.user.gtagConfig = #{options[:gtag_config].presence || {}};"
          script += "(tarteaucitron.job = tarteaucitron.job || []).push('gtag');"
        end

        if options["googletagmanager"]
          script += "tarteaucitron.user.googletagmanagerId = '#{options["googletagmanager"]}';"
          script += "(tarteaucitron.job = tarteaucitron.job || []).push('googletagmanager');"
        end

        if options["googlemaps"]
          script += "tarteaucitron.user.googlemapsKey = '#{options["googlemaps"]}';"
          script += "(tarteaucitron.job = tarteaucitron.job || []).push('googlemaps');"
        end

        if options["matomo"]
          script += "tarteaucitron.user.matomoId = '#{options["matomo"]["id"]}';"
          script += "tarteaucitron.user.matomoHost = '#{options["matomo"]["url"]}';"
          script += "(tarteaucitron.job = tarteaucitron.job || []).push('matomo');"
        end

        if options["facebook"]
          script += "(tarteaucitron.job = tarteaucitron.job || []).push('facebook');"
        end

        if options["googleplus"]
          script += "(tarteaucitron.job = tarteaucitron.job || []).push('gplus');"
        end

        if options["twitter"]
          script += "(tarteaucitron.job = tarteaucitron.job || []).push('twitter');"
        end

        if options["typekit"]
          script += "tarteaucitron.user.typekitId = '#{options["typekit"]}';"
          script += "(tarteaucitron.job = tarteaucitron.job || []).push('typekit');"
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

    def googleplus(options = {})

      default_options = {size: "small", annotation: "inline", width: "300"}
      options = default_options.merge(options)

      content_tag(:div, '', class: "g-plusone", data: options).html_safe

    end

    def twitter(options = {})

      result = ""

      default_options = {via: "twitter_username", count: "vertical", dnt: "true"}
      options = default_options.merge(options)

      result += content_tag(:span, '', class: "tacTwitter").html_safe

      result += content_tag(:a,'', href: "https://twitter.com/share", class: "twitter-share-button", data: options).html_safe

      result.html_safe

    end

    def cookie_manager_link(text = "Gestion des cookies")

      content_tag(:a, h(text), href: "javascript:tarteaucitron.userInterface.openPanel();").html_safe

    end

  end
end
