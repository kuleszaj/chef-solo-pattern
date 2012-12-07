name "passenger"
description "Passegner Install"
run_list(
  "role[apache2]",
  "role[rvm]",
  "recipe[rvm_passenger::apache2]",
)
override_attributes(
  :rvm_passenger => {
    :version => "3.0.17",
    :rvm_ruby => "ruby-1.9.3-p194@passenger",
    :passenger_max_pool_size => "4",
    :passenger_min_instances => "4",
    :rails_framework_spawner_idle_time => "0",
    :rails_app_spawner_idle_time => "0"
  }
)
