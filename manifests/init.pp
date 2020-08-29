# dispatch between firewall stuff
class firewall {
  if ($facts['os']['name'] == 'CentOS') and versioncmp($facts['os']['release']['major'],'8') < 0 {
    $use_nftables = false
  } else {
    $use_nftables = true
  }
}
