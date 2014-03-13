# vim: sts=4 ts=4 sw=4 expandtab autoindent
#
#INSTALL SKYPE ON DESKTOP
#
class bumblebee ($driver_name = "nvidia-current", $package_name = "bumblee-nvidia"){
    #Install package
    package { $package_name: ensure   => installed,}

    #Change xorg.conf (acer v3571g)
    file { "/etc/bumblebee/bumblebee.conf":
        replace => "yes",
        owner   => "root",
        mode    => 644,
        require => Package[$package_name],
        content => template('bumblebee/bumblebee.conf'),
    }
}
