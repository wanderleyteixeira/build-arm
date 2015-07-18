Install Debian 7.8 on VirtualBox
============

1. Launch VirtualBox
2. Click on `New`
3. `Name and operating system`
    * Name: Debian
    * Type: Linux
    * Version: Debian (64 bit), hit `Continue`
4. `Memory size`
    * Change to 1024 MB, `Continue`
5. `Hard drive`
    * Create a vitual hard drive now, `Create`
6. `Hard drive file type`
    * VDI, `Continue`
7. `Storage on physical hard drive`
    * Dynamically allocated, `Continue`
8. `File location and size`
    * Type a name: Debian
    * Change size of the virtual hard drive to 20 GB, `Create`

9. Highlight the new virtual machine
10. `Settings` - `Network`
    * Enable `Adapter 1`
    * Attached to: Bridge Adapter
    * Name: <chose the name of your adapter>, `OK`

11. Start the newly created virtual machine named "Debian"
12. Choose the Debia ISO downloaded (debian-7.8.0-amd64-netinst.iso
13. `Start`
14. Choose `Install` from the installation menu
15. `Select a language:`
    * Choose `English`
16. `Select your location`
    * Choose `United States`
17. Configure the keyboard 
    * Choose `American English`
18. Configure the network - Hostname:
    * Hostname: `tomato`
    * Domain name: `blank`
19. Set up users and passwords
    * Root password: `somepassword`
    * Full name for the new user: `blank`
    * Username for your account: `tomato`
    * Choose a password for the new user: `somepassword`
20. Configure the clock
    * Choose `Eastern`
21. Partition disks
    * Partitioning method: `Guided - use entire disk`
    * Select disk
    * Partitioning scheme: `Separate /home partition`
    * Finish partitioning and write changes to disk
    * Write the changes to disks: `Yes`

Installing the base system

22. Configure the package manager
    * Debian archive mirror country: `United States`
    * Debian archive mirrir: `ftp.us.debian.org`
    * HTTP proxy information (blank for none): `blank`
	
Configuring apt
Select and install software

23. Configure popularity-contest
    * Participate in the package usage survey: `No`
24. Software selection
    * Choose software to install: `[*] Standard system utilities`
    * **Note: Unselect all others**

25. Install the GRUB boot loader on a hard disk
    * Install the GRUB boot loader to the master boot record: `Yes`


Finish the installation
After reboot you will not have ssh installed. You must install that now.

Login as tomato	
	
