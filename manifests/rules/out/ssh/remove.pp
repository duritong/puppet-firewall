# remove out firewall ssh
class firewall::rules::out::ssh::remove {
  include firewall
  if $firewall::use_nftables {
    include nftables::rules::out::ssh::remove
  } else {
    include shorewall::rules::out::ssh::remove
  }
}
