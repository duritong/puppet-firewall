# outgoing keyserver
class firewall::rules::out::keyserver {
  include firewall
  if $firewall::use_nftables {
    include nftables::rules::out::keyserver
  } else {
    include shorewall::rules::out::keyserver
  }
}
