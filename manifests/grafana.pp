class profiles::grafana {

  
  class { 'grafana':
      install_method  => 'latest',
	  }
	  
grafana_dashboard { 'example_dashboard':
  grafana_url       => 'http://localhost:3000',
  grafana_user      => 'admin',
  grafana_password  => 'admin',
  content           => template('path/to/exported/file.json'),
}
	  
grafana_datasource { 'influxdb':
  grafana_url       => 'http://localhost:3000',
  grafana_user      => 'admin',
  grafana_password  => 'admin',
  type              => 'influxdb',
  url               => 'http://localhost:8086',
  user              => 'admin',
  password          => 'test123',
  database          => 'ressources',
  access_mode       => 'proxy',
  is_default        => true,
  json_data         => template('path/to/additional/config.json'),
}
}
