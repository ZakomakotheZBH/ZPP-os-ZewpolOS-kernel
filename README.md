# ZTK OS

**Zewpol Toolkit Operating System** - Built with ZPPOS language

## Features

- 🖥️ Desktop PC target (x86_64)
- 🎨 Zui+ GUI toolkit
- 📦 `/data@` data collection extension
- 🌐 `/nodejsosserver@` built-in web server
- 💾 Statica binary-to-text conversion
- 🔧 Mal hardware abstraction layer
- 📱 Mobile support (coming soon)

## Quick Build

```bash
spck build ztk.conf
spck iso -o ztk.iso
qemu-system-x86_64 -cdrom ztk.iso -m 4G
