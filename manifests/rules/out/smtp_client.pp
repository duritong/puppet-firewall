# outgoing smtp client
class firewall::rules::out::smtp_client {
  include firewall
  if $firewall::use_nftables {
    include nftables::rules::out::smtp_client
  } else {
    include shorewall::rules::out::smtps
    include shorewall::rules::out::smtp_submit
  }
}
