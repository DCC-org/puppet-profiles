class profiles::grafana {

  class{'::grafana':
  }

  grafana_dashboard{'example_dashboard':
    grafana_url      => 'http://localhost:3000',
    grafana_user     => 'admin',
    grafana_password => 'admin',
    content          => template('profiles/grafana_dashboard.json.erb'),
  }

  grafana::plugin{'grafana-simple-json-datasource':}

  grafana_datasource{'SimpleJson':
    grafana_url      => 'http://localhost:3000',
    grafana_user     => 'admin',
    grafana_password => 'admin',
    type             => 'grafana-simple-json-datasource',
    url              => 'http://swoarly.de:8080',
    access_mode      => 'proxy',
    is_default       => false,
  }
}
