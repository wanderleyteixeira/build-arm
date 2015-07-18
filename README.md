# Compile Tomato ARM
This script will help you create a Tomato Firmware for ARM-based router on Debian 7.8 (64-bit). This was tested on [Shibby release 130](http://tomato.groov.pl).


Create a linux environment using a VirtualBox:
---------------------
* Install the free [VirtualBox](http://www.virtualbox.org/wiki/Downloads)

* Download [Debian 7.8 iso](http://cdimage.debian.org/mirror/cdimage/archive/7.8.0/amd64/iso-cd/debian-7.8.0-amd64-netinst.iso) 

* Now on Virtualbox, create a virtual machine and set approximately 20 GB of space and save

* After the virtual machine is created, go to the `Settings` in VirtualBox and enable two `Network Adapters`. Set one as a `Bridge Adapter` and select the device name. Save

* Mount the Debian iso on the virtual drive

* Start the virtual machine and install Debian. Make sure that only the Standard system utilities are installed

* Once logged in, you can start preparing the system

* Install ssh, sudo, git and git-core:
```bash
   # apt-get install -y openssh-server sudo git git-core
   ```

* Add the user you will compile tomato to the sudo group. Here, my user is called `tomato`:
```bash
   # sudo usermod -a -G sudo tomato
   ```

**The change will only take effect the next time the user logs in, so please logout**

* Clone this repository:
```bash
   $ git clone https://github.com/wbtf/build-arm.git
   ```

* If all goes well, you should be ready to start compiling the Tomato ARM now. Run:
```bash
   /home/tomato/build-arm/apt.sh
   ```


Compile
---------------------

* Compile for AC68U:
```bash
   $ source /home/tomato/.profile
   $ cd $HOME/tomato-make/release/src-rt-6.x.4708
   $ make ac68z V1=RT-AC6x V2=1.0
   ```

* Once completed, you will find your router image inside the image folder:
```bash
   cd $HOME/tomato-make/releasesrc-rt-6.x/image
   ```



Troubleshoot
---------------------
* Type ```make help``` to see the options to build for each model

* To start a clean compilation:

```bash
    cd $HOME/tomato-make/release/src-rt-6.x.4708/
    git clean -dfx && git checkout
   ```


**Note: Use at your own risk. Be careful and thoughtful not to brick your router.**
