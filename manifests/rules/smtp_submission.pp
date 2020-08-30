# manage incoming smtp submission
class firewall::rules::smtp {
  include firewall
  if $firewall::use_nftables {
    include nftables::rules::smtp_submission
  } else {
    include shorewall::rules::smtp_submission
  }
}
