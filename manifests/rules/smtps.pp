# manage incoming smtps
class firewall::rules::smtps {
  include firewall
  if $firewall::use_nftables {
    include nftables::rules::smtps
  } else {
    include shorewall::rules::smtps
  }
}
