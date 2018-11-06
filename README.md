# e3-tsclib
Userspace library for TSC kernel module

## ESS bitbucket account is required

One needs to have the ESS bitbucket accout. **make init** will ask the bitbucket user name and its password. In order to minimize that case, one can add the ssh key in ones account. After that, the following command should be executed in order to use the different url instead of the default one.


```
git config --global url."git@bitbucket.org:".insteadOf https://bitbucket.org/
```


## Kernel module (tsc.ko and pon.ko) can be installed via DKMS


```sh
$ make init
$ make patch
$ make dkms_add
$ make dkms_build
$ make dkms_install
```

In order to remove them

```sh
$ make dkms_uninstall
$ make dkms_remove
```

## Kernel modules configuration

* Create and load the autoload configuration in /etc/modules-load.d/mrf.conf
* Remove and load the kernel module with modprobe

```sh
$ make setup
```

In order to clean the configuration,

```sh
$ make setup_clean
```

## Notice
If one has already the running dkms.service in systemd, the next reboot with new kernl image will make the kernel module be ready. However, if one doesn't have one, please run bash dkms/dkms_setup.bash in order to enable dkms.service.

```
$ bash dkms/dkms_setup.bash
$ systemctl status dkms
● dkms.service - Builds and install new kernel modules through DKMS
   Loaded: loaded (/etc/systemd/system/dkms.service; enabled; vendor preset: ena
   Active: active (exited) since Sun 2018-07-29 01:13:59 CEST; 4s ago
     Docs: man:dkms(8)
  Process: 3271 ExecStart=/bin/sh -c dkms autoinstall --verbose --kernelver $(un
 Main PID: 3271 (code=exited, status=0/SUCCESS)
