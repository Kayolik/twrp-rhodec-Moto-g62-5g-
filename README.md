# TWRP for Motorola G62 5G (rhodec)

Unofficial TWRP build for the **Motorola G62 5G (`rhodec`)**.

This was built from source using the TeamWin device tree `android_device_motorola_rhodep`.

## Status

The build was successfully compiled and tested on a Motorola G62 5G.

What was tested:

* TWRP builds successfully
* `boot.img` was generated successfully
* TWRP boots using `fastboot boot`
* Touchscreen works

Permanent flashing may work, but it has not been tested enough to guarantee that it is safe on every firmware version.

## Device

* Device: Motorola G62 5G
* Codename: `rhodec`
* Architecture: `arm64`

One thing that may look confusing: the device tree and Android build target use `rhodep` in their names. The device tested with this build is the **G62 (`rhodec`)**.

## Source

The build is based on the TeamWin device tree:

`TeamWin/android_device_motorola_rhodep`

Thanks to **TeamWin and everyone who contributed to the original device tree and TWRP work.**

## Building

Sync the TWRP source:

```bash
repo sync -c --force-sync --no-clone-bundle --no-tags -j4
```

Copy the device tree into:

```text
device/motorola/rhodep
```

Then use Bash and run:

```bash
source build/envsetup.sh
lunch twrp_rhodep-eng
```

Build:

```bash
mka bootimage -j4
```

The resulting image is:

```text
out/target/product/rhodep/boot.img
```

The build completed successfully.

## Testing

The image was tested by booting it temporarily from the bootloader.

First:

```bash
fastboot reboot bootloader
```

Then:

```bash
fastboot boot out/target/product/rhodep/boot.img
```

Fastboot successfully sent and booted the image.

The touchscreen was also tested and works on the G62.

Temporary booting is recommended before trying to flash the recovery permanently.

## Flashing

Permanent flashing is possible, but **not guaranteed**.

I have not tested permanent flashing enough to guarantee that it will work correctly on every firmware version or configuration.

If you decide to flash it, you do so at your own risk.

I am **not responsible for bricked devices, bootloops, data loss, or any other damage** caused by using this build.

Keep a way to restore the stock firmware before experimenting.

## ADB

ADB detection was tested.

During testing, normal ADB showed the device as `unauthorized`, while another transport appeared in `sideload` mode.

Because of this, normal ADB functionality should currently be considered **untested / incomplete**.

## Bugs

If you find a bug, report it on Discord to:

**`t3zna`**

Please include as much information as possible, especially:

* device/firmware version
* what you were doing
* the error you got
* recovery logs, if available

## Disclaimer

This is an unofficial and experimental build.

Use it at your own risk.

I do not take responsibility for any damage or data loss caused by using, booting, or flashing this image.

## Credits

Thanks to **TeamWin** and the original contributors of the device tree:

`android_device_motorola_rhodep`

And thanks to everyone who works on TWRP and Android development.

---

**Device:** Motorola G62 5G (`rhodec`)
**Status:** Experimental
**Touchscreen:** Working
**Temporary boot:** Working
**Permanent flashing:** Not guaranteed
