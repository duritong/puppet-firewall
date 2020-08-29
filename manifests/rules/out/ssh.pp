class firewall::rules::out::ssh {
  include firewall
  if $firewall::use_nftables {
    include nftables::rules::out::ssh
  } else {
    include shorewall::rules::out::ssh
  }
}

