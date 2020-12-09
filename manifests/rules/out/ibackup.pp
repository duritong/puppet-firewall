# manage firewall for outgoing ssh
class firewall::rules::out::ibackup(
  Array[Stdlib::IP::Address::Nosubnet] $backup_hosts,
){
  include firewall
  if $firewall::use_nftables {
    $backup_hosts.each |$index,$ip| {
      if $ip =~ Stdlib::IP::Address::V4::Nosubnet {
        $dest = "ip daddr ${ip}"
      } else {
        $dest = "ip6 daddr ${ip}"
      }
      nftables::rule {
        "default_out-ssh_ibackup-${index}":
          content => "${dest} tcp dport 22 accept",
      }
    }
  } else {
    class{'shorewall::rules::out::ibackup':
      backup_hosts => $backup_hosts,
    }
  }
}
