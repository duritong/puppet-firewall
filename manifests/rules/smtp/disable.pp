class firewall::rules::smtp::disable {
  include firewall
  if $firewall::use_nftables {
    notice 'to be implemented'
  } else {
    include shorewall::rules::smtp::disable
  }
}
