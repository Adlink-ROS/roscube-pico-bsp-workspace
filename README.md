# ROScube Pico Board Support Package Yocto Workspace

This repository is to develope ADLINK ROScube Pico Series including bootloader, kernel, filesystem and user application. The reason we want to use Yocto is to provide out customers a flexible environment, they can easily customize software compoments redardless of hardware archiecture whinin one workspace. User can use different configuration to compose their board support package or software stack. They can also build a minimal system with less storage useage or memeory usage. 

This workspace supports the following models.

### Models

* ROScube Pico NX
* ROScube Pico Nano

## Preparation

Install required tools

```
sudo apt install chrpath gawk
```

Download base meta layers.

```
$> git clone git://git.yoctoproject.org/poky.git -b dunfell layers/poky-dunfell
$> git clone git://git.openembedded.org/meta-openembedded -b dunfell layers/meta-openembedded
$> git clone git://git.yoctoproject.org/meta-virtualization -b dunfell layers/meta-virtualization
$> git clone https://github.com/madisongh/meta-tegra.git -b dunfell-l4t-r32.4.3 layers/meta-tegra
$> git clone git@github.com:Adlink-ROS/meta-roscube.git -b master layers/meta-roscube
```

Source the poky environment.

```
$> source layers/poky-dunfell/oe-init-build-env build
```

Add meta layers
```
$:build> bitbake-layers add-layer ../layers/meta-openembedded/meta-oe
$:build> bitbake-layers add-layer ../layers/meta-openembedded/meta-python
$:build> bitbake-layers add-layer ../layers/meta-openembedded/meta-networking
$:build> bitbake-layers add-layer ../layers/meta-openembedded/meta-multimedia
$:build> bitbake-layers add-layer ../layers/meta-openembedded/meta-virtualization
$:build> bitbake-layers add-layer ../layers/meta-openembedded/meta-gnome
$:build> bitbake-layers add-layer ../layers/meta-openembedded/meta-xfce
$:build> bitbake-layers add-layer ../layers/meta-tegra
$:build> bitbake-layers add-layer ../layers/meta-roscube
```

## Build images

```
$> MACHINE=roscube-pico-nx bitbake <image type>
```
