# Define the data source for fetching extensions versions
data "talos_image_factory_extensions_versions" "this" {
  talos_version = "v1.7.5" # Set the Talos version
  filters = {
    names = [
      "binfmt-misc",
      "bnx2-bnx2x",
      "btrfs",
      "cloudflared",
      "ecr-credential-provider",
      "fuse3",
      "gasket-driver",
      "glibc",
      "gvisor",
      "gvisor-debug",
      "hello-world-service",
      "iscsi-tools",
      "kata-containers",
      "lldpd",
      "qemu-guest-agent",
      "realtek-firmware",
      "spin",
      "stargz-snapshotter",
      "tailscale",
      "uinput",
      "usb-modem-drivers",
      "util-linux-tools",
      "v4l-uvc-drivers",
      "vmtoolsd-guest-agent",
      "wasmedge",
      "zfs",
    ]
  }
}

# Create the factory schematic with the required customizations
resource "talos_image_factory_schematic" "this" {
  schematic = yamlencode(
    {
      # Define customization
      overlay = {
        image = "siderolabs/sbc-rockchip"
        name  = "turingrk1"
      }
      customization = {
        systemExtensions = {
          officialExtensions = data.talos_image_factory_extensions_versions.this.extensions_info.*.name
        }
      }
    }
  )
}
