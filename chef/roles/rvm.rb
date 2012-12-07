name "rvm"
description "RVM Install"
run_list(
  "recipe[rvm::system]"
)
override_attributes(
  :rvm => {
    :default_ruby => "ruby-1.9.3-p194",
  }
)
