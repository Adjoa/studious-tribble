node default {
  if $::hostname =~ /^puppetserver/ {
    $role = "puppetserver"
   }

  class{"roles::${role}": }

  host {"puppet":
    ip => $::middleware_ip,
  }
}
