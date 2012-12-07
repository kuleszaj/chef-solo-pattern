name "apache2"
description "Systems that serve HTTP and HTTPS"
override_attributes(
 "apache" => { "listen_ports" => [ "80","443" ]  } 
)
run_list(
  "recipe[apache2::default]",
  "recipe[apache2::mod_ssl]",
  "recipe[apache2::mod_expires]"
)
