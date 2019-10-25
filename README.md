# e3-tsclib
Userspace library for TSC kernel module

## ESS bitbucket account is required

One needs to have the ESS bitbucket accout. **make init** will ask the bitbucket user name and its password. In order to minimize that case, one can add the ssh key in ones account. After that, the following command should be executed in order to use the different url instead of the default one.


```
git config --global url."git@bitbucket.org:".insteadOf https://bitbucket.org/
```

## Initialize repository
```
e3-tsclib (master)$ make init
```

## TscMon and SemeCalibration within `EPICS_HOST_ARCH`

This is *only* for the heavily development environment. The production environment should has its own version within Linux Images.

```sh
e3-tsclib (master)$ make tsc-build
e3-tsclib (master)$ make tsc-install
e3-tsclib (master)$ tree bin/
bin/
└── [jhlee    4.0K]  linux-x86_64
    ├── [jhlee    448K]  SmemCalibration
    └── [jhlee    448K]  TscMon

```


## Kernel module (tsc.ko and pon.ko) can be installed via DKMS


```sh
e3-tsclib (master)$ make dkms_add
e3-tsclib (master)$ make dkms_build
e3-tsclib (master)$ make dkms_install
```

In order to remove them

```sh
e3-tsclib (master)$ make dkms_uninstall
e3-tsclib (master)$ make dkms_remove
```

## Kernel modules configuration

* Create and load the autoload configuration in /etc/modules-load.d/mrf.conf
* Remove and load the kernel module with modprobe

```sh
e3-tsclib (master)$ make setup
```

In order to clean the configuration,

```sh
e3-tsclib (master)$ make setup_clean
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
