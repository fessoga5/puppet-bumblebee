# vim: sts=4 ts=4 sw=4 expandtab autoindent
#
#INSTALL SKYPE ON DESKTOP
#
class bumblebee ($driver_name = "nvidia-current", $package_name = "bumblebee-nvidia", $user = "root"){
    #Install package
    package { $package_name: ensure   => installed,}
    
    #Fix for usergroup
    exec {"usermod -a -G bumblebee ${user}": path => ["/usr/bin", "/usr/sbin"],}
    
    #bbswitch
    #package {"": ensure => installed,}
    
    #Change xorg.conf (acer v3571g)
    file { "/etc/bumblebee/bumblebee.conf":
        replace => "yes",
        owner   => "root",
        mode    => 644,
        content => template('bumblebee/bumblebee.conf'),
    }

    #Nvdia xorg conf
    file { "/etc/bumblebee/xorg.conf.nvidia":
        replace => "yes",
        owner   => "root",
        mode    => 644,
        content => template('bumblebee/xorg.conf.nvidia'),
    }
    #Xorg.conf
    file { "/etc/X11/xorg.conf":
        replace => "yes",
        owner   => "root",
        mode    => 644,
        content => template('bumblebee/xorg.conf'),
    }
}
