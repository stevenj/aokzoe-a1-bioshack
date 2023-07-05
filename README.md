# Simple Bios Hack for AOKZOE-A1 with Grub/Linux

This is a Linux/Grub implementation of the notes found on the AOKZOE Discord here: <https://discord.com/channels/978620291926351942/1080483878071971942/1090298047356993538>

***NOTE: This ONLY Works with AOKZOE-A1 and BIOS VERSION 1.3.  No other Bios is currently supported.***

What it does is it tweaks otherwise hidden Bios settings to alter the default behaviour of the AokZoe Bios.

The settings that can be changed are listed in the file: [AOKZOE-A1 v1.3 Bios Settings]

## Quick start

1. Copy the [boot](./boot/) directory in this repo to your `/boot` directory on the AokZoe.
   1. Note,  it will already have things in `/boot` do not overwrite anything.  These should just be additional files.
2. Copy the [40_custom](./etc/grub.d/40_custom) file to `/etc/grub.d/40_custom`.
   1. Note, this file already exists on your AokZoe.  If you added anything to it,  merge my changes to your existing `40_custom` file.
3. Make sure your Grub Menu is enabled in `/etc/default/grub`. Which i do by setting:

    ```ini
    GRUB_TIMEOUT=5
    GRUB_TIMEOUT_STYLE=menu
    ```

4. Update Grub.  To do that, I run:

    ```sh
    sudo grub-mkconfig -o /boot/grub/grub.cfg
    ```

5. Reboot your device.
6. In Grub,  choose `EFI Shell`
7. After `EFI Shell` runs, from the EFI Shell prompt, type:

   ```sh
   fs0:
   x_a1_130.nsh
   ```

8. After the settings are written (which is quick), type `exit`.
9. Back in GRUB Menu, Choose to run your `EFI Bios` then select `Save and Exit` without making any other changes.

Your device should reboot and the changes defined in the [x_a1_130.nsh] should be active.

## What did I tweak?

There are a number of tweaks,  the most visible are:

1. Set `tctl-temp` to 95 degrees C.
   1. This means its no longer necessary to tweak this with RyzenAdj to prevent excessive thermal throttling.
2. Allows any legal value to be set to `stapm-limit` with ryzen-adj.
   1. Turbo still switches between 15 and 28W.  Its possible to set a higher wattage now with RyzenAdj, use *AT YOUR OWN RISK*.
3. Limits the Memory to 5500MT/s.
   1. In benchmarks this does reduce main meory speed from ~22GB/s to ~17GB/s.
   2. I haven't noticed any speed decrease playing the games I play.
   3. I did this because I was getting hard resets in some games. Since changing this I haven't had a hard reset once.
   4. YMMV.

See the [x_a1_130.nsh] file for full details, its fully commented.
Also, some of the settings are the actual BIOS default,  but I just copied the file provided in the Original Discord link and tweaked it how I wanted.

## Dumping your Raw Bios Settings from Linux

Its possible to see all the Bios settings directly from linux with the following command:

```sh
efivar -n 3a997502-647a-4c82-998e-52ef9486a247-AmdSetup
```

This will give you a hexdump of 0x6bc bytes long.
The individual settings are located at the same offsets as found in the [x_a1_130.nsh](./boot/efi/x_a1_130.nsh) file.

It is possible to dump this memory to a file with the `efivar` command,  and over-write it with the contents of another dump.

In theory this could be used to create a tool in linux to tweak these settings with a menu.

I haven't tested if this works, but it should.

This is also useful to test if your changes applied the way you expected.
After changing a setting,  you can dump the whole table, and check if the offset is what you expect it should be.

## Checking Memory Speed

Run:

```sh
dmidecode --type 17
```

It will tell you the maximum detected memory speed and the configured memory speed.

Also,  the speed affects the speed test result for ram provided by Memtest,  which is also included in this setup.

## Making Sure the Bios settings applied

I did notice a few quirks where settings did not seem to apply after setting them.
Its possible that they are only read when the Bios first boots, and so a normal "reboot" doesn't actually cause them to apply.

To get them to apply reliably,  I ran the AOKZOE Bios,  did not change anything, and selected "Save and Exit".
After this, my settings would reliably be applied.
Running the BIOS did not seem to modify any of the values I was playing with.

## What About the AokZoeA1 Pro, or other Bios Versions?

The method I use here will work in all likelihood on newer bios versions and other devices,  not just AokZoe ones.

BUT you will need to extract an equivalent [AOKZOE-A1 v1.3 Bios Settings] file matching your installed Bios.

You will also need to get a new dump of the available settings and make a copy of the [x_a1_130.nsh] file for your new bios version.

## What about if I update my Bios

Your customization will probably get lost.

Also, see: [Above](#what-about-the-aokzoea1-pro-or-other-bios-versions)

## How do I do this from windows?

I don't know.  I run Linux...

## I ran this and I bricked my device

**DO NOT RUN ANYTHING IN THIS REPO IF YOU WILL COMPLAIN IF YOU BRICK YOUR DEVICE.**

**I OFFER NO WARRANTY OR GUARANTEE THAT ANYTHING HERE IS SAFE.**

**YOU ARE SOLELY RESPONSIBLE FOR ALL RISKS ASSOCIATED WITH THIS.**

**THIS REPO IS JUST A COLLECTION OF NOTES FOR SOMETHING I DID TO MY DEVICE.**

## Contributions

If you dump a different bios version, or do it for a different device, I will accept PRs for their Bios Setings files, and your settings tweak file.

If you find any other useful tweaks in the BIOS Settings, which improve reliability or performance, PR's also welcome.

[AOKZOE-A1 v1.3 Bios Settings]: 1.30-Section_PE32_image_372079F5-0070-4907-922A-4C18A1F562A2_CbsSetupDxeRMB.sct.0.0.en-US.ifr.txt
[x_a1_130.nsh]: ./boot/efi/x_a1_130.nsh

## Bonus

[update-ec-bios.sh](./update-ec-bios.sh) is also provided in this repo.

Updating BIOS in Linux is easy,  just copy the Bios `.bin` file to `/boot/efi`  and flash it directly from the Bios itself.

But to update the EC Firmware requires a Windows Only tool.

This script does what that tool does.
After updating your bios version,  run this script as root and reboot.
Your BIOS will then automatically re-flash the EC Firmware to match your Bios version.
