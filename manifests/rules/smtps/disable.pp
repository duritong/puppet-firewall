class firewall::rules::smtps::disable {
  include firewall
  if $firewall::use_nftables {
    notice 'to be implemented'
  } else {
    include shorewall::rules::smtps::disable
  }
}
