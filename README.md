# Snapdragon X Elite (SC8380XP) Kernel Repository for Debian/Ubuntu

This repository provides automated, third-party APT builds of the **Linaro `qcom-laptops` kernel**. These kernels track the Linux mainline closely and include specific patches to support the Qualcomm Snapdragon X Elite (SC8380XP) ecosystem on Debian-based distributions.

---

## 🚀 Key Features

* **Mainline Tracking:** Built from the latest Linaro experimental and integration trees.
* **Automated Builds:** Powered by GitHub Actions to ensure the latest patches and security updates are available quickly.
* **Debian Optimized:** Packages follow standard Debian kernel naming conventions for seamless installation and management.

---

## 💻 Supported Devices

The following prototype and retail devices are currently supported by the kernels provided in this repository:

| Manufacturer | Model |
| :--- | :--- |
| **Lenovo** | ThinkPad T14s Gen 6 / Yoga Slim 7x / Yoga Air 14s |
| **ASUS** | Vivobook S 15 (S5507) |
| **Dell** | XPS 13 (9345) |
| **HP** | OmniBook X 14 |
| **Qualcomm** | SC8380XP CRD (Customer Reference Design) |

---

## 🛠 Usage Instructions

Follow these steps to add the repository and install the optimized kernel.

### 1. Add the GPG Key (No longer required)
To ensure package integrity, add the repository's public key to your system:

```bash
wget -qO - https://<your-username>.github.io/<your-repo-name>/KEY.gpg | sudo gpg --dearmor -o /usr/share/keyrings/qcom-laptops-archive-keyring.gpg

### 2. Add the repository

```bash
echo "deb [trusted=yes] https://android-piepaint.github.io/qcom-laptop-apt-repo stable main" \
 | sudo tee /etc/apt/sources.list.d/qcom-laptop.list

 sudo apt update
```

### 3. Install latest kernel

Use `apt search` to search the kernel version you want to install.</br>

```bash
sudo apt search linux-images

sudo apt install linux-image-6.19.0-rc7-g19e59e1b39ad
```

Restart your computer, then you're ready to rock! </br>

## ⚠️ Disclaimer

> Warning: This is a third-party community repository. While these kernels are based on official Linaro </br>
> sources, they are considered experimental. Use them at your own risk. Always maintain a stable backup </br>
> kernel to ensure you can recover your system in the event of a boot failure. </br>

## 🤝 Contributing

Have you tested this kernel on a device not listed here? Or perhaps you've encountered hardware-specific bugs (e.g., Wi-Fi, Audio, or GPU issues)?</br>
</br>
Contributions are welcome! Please feel free to [open an Issue](https://gitlab.com/Linaro/arm64-laptops/linux/-/issues) or submit a Pull Request to help improve Snapdragon X Elite support on Linux. 