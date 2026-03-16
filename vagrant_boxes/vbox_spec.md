# Vagrantfile used by vagrant:

This folder locates each vagrant-box Vagrantfile, which mentioned requires customize to created a virtualbox by VirtualBox and Vagrant:

## This project requires two platform BOX:

   - vm1_ub2204_server/ created for VirtualBox by installed ubuntu jammy server edition and other packages maintioned of BOX1 in packages/packages_src.md

   - vm2_ub2204_desktop/ created for VirtualBox by installed ubuntu jammy desktop edition and other packages maintioned of BOX2 in packages/packages_src.md

## Jobs to do for these platform BOX:

   1. generate access key paire and stored in vagrant_keys/ subfolder
      ```bash
      DIR_PROJECT="$CI_PROJECT_DIR"
      ssh-keygen -t ed25519 -f $DIR_PROJECT/vagrant_keys/.
      ```

   2. each BOX required to reuse key paire in vagrant_keys/ and stored in each vbox workfolder.

   3. shared such folders to each BOX
      $DIR_PROJECT/vagrant_boxes    synced to BOX folder: /vagrant
      $DIR_PROJECT/packages         synced to BOX folder: /opt/package_cache
      $DIR_PROJECT/testcases        synced to BOX folder: /opt/testcases

      each BOX install package from /opt/package_cache if have. If not exist then download package to it then installed.

   4. Create each .Vagrantfile for each vbox in their workfolder

