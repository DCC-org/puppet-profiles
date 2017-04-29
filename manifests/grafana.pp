class profiles::grafana {

  class{'::grafana':
  }

  grafana_dashboard{'example_dashboard':
    grafana_url      => 'http://localhost:3000',
    grafana_user     => 'admin',
    grafana_password => 'admin',
    content          => template('profiles/grafana_dashboard.json.erb'),
  }

  grafana_datasource{'json':
    grafana_url      => 'http://localhost:3000',
    grafana_user     => 'admin',
    grafana_password => 'admin',
    type             => 'SimpleJson',
    url              => 'http://localhost:8080',
    access_mode      => 'proxy',
    is_default       => true,
  }
}
