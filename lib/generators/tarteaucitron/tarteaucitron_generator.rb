class TarteaucitronGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def download_tarteaucitron
    files = %w(
      lang/tarteaucitron.ru.js
      lang/tarteaucitron.es.js
      lang/tarteaucitron.pt.js
      lang/tarteaucitron.pl.js
      lang/tarteaucitron.de.js
      lang/tarteaucitron.fr.js
      lang/tarteaucitron.it.js
      lang/tarteaucitron.en.js
      README.md
      css/tarteaucitron.css
      tarteaucitron.js
      tarteaucitron.services.js
      LICENSE
      advertising.js
    )

    url = "https://raw.githubusercontent.com/AmauriC/tarteaucitron.js/master/"

    files.each do |file|

      get url + file, "public/tarteaucitron/#{file}"

    end

  end

  def download_geocat

    url = "http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz"

    get url, "db/GeoIP.dat.gz"

    run "gunzip db/GeoIP.dat.gz"

  end

end
