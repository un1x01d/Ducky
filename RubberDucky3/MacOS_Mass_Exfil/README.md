# **💀 SILENT MACOS EXFILTRATOR 💀**  
### _"Collect. Encrypt. Exfiltrate. Disappear."_  

> **Author:** `un1x01d`  
> **Mission:** _Silent data collection on macOS with stealth exfiltration capabilities._  
> **Payload Type:** USB Rubber Ducky (HID + Storage)  
> **Target OS:** macOS  

---

## **⚙️ DESCRIPTION**

Welcome to the **Silent macOS Exfiltrator** – a stealth payload designed to **silently collect and exfiltrate sensitive files** from macOS devices using a **Rubber Ducky USB**. This payload executes covert data collection operations and exfiltrates the information via multiple protocols, ensuring maximum stealth.

💀 **What’s a Rubber Ducky?**  
The **Rubber Ducky** is a **malicious USB device disguised as a keyboard** that executes pre-programmed keystrokes on any system it’s plugged into. Think of it as a hacker’s best friend, capable of automating exploits, launching scripts, and bypassing security with ease.

---

## **🔥 FEATURES**

- ✅ **Silent Execution:** Rubber Ducky payload runs the bash script in the background without raising alarms.  
- ✅ **Multi-Method Exfiltration:** HTTPS, SCP, Dropbox, Google Drive, AWS S3, Google Cloud Storage (GCS).  
- ✅ **Data Targeting:** Collects files, keychains, browser profiles, SSH keys, and more.  
- ✅ **Encryption:** Uses AES-256 encryption to secure exfiltrated data.  
- ✅ **Cleanup:** Wipes traces to cover your tracks.  

---

## **🔧 PAYLOAD WORKFLOW**

1. **Insert USB Rubber Ducky** into a macOS machine.  
2. Rubber Ducky switches to **HID + Storage mode** and launches Terminal via **Spotlight.**  
3. Terminal window is resized and hidden to run the payload **silently.**  
4. The script collects the following data:
   - **Files:** Documents, PDFs, spreadsheets, presentations.  
   - **Keychains:** Passwords and authentication keys.  
   - **Browser Data:** Chrome, Brave, Firefox, Safari.  
   - **Network Details:** Active connections, saved Wi-Fi networks.  
   - **SSH Keys, GPG Keys, Configs.**  

5. **Exfiltration Methods:**  
   - HTTPS (with self-signed cert)  
   - SCP (via SSH private key)  
   - Dropbox API  
   - Google Drive API  
   - AWS S3  
   - Google Cloud Storage  

6. **Cleanup:** The script **removes traces** from the system and clears history files.  

---

## **📂 FILE STRUCTURE**

```bash
📂 RubberDuckyPayload/
 ├── 📄 payload.txt         # Rubber Ducky payload script (HID commands)
 ├── 📄 silent_exfil.sh     # Main bash exfiltration script
 ├── 📄 exfil.crt           # Self-signed HTTPS certificate
 └── 📄 exfil.pem           # SSH private key for SCP exfiltration
```

---

## **💻 INSTALLATION**

### **1️⃣ Setup Rubber Ducky Using PayloadStudio:**

Hak5's **PayloadStudio** is now the recommended method for creating and compiling Rubber Ducky payloads. **PayloadStudio** is a web-based, feature-rich IDE for building, testing, and managing payloads for the Rubber Ducky.

#### **🔗 Access PayloadStudio:**

- **Community Edition:**  
  👉 [https://payloadstudio.hak5.org/community](https://payloadstudio.hak5.org/community)  

- **Pro Edition:**  
  👉 [https://shop.hak5.org/products/payload-studio-pro](https://shop.hak5.org/products/payload-studio-pro)  

#### **📖 Steps to Use PayloadStudio:**

1. **Open PayloadStudio** in your browser.  
2. **Create a new project** and paste the `payload.txt` into the editor.  
3. **Compile the payload** into the `inject.bin` format using PayloadStudio's built-in tools.  
4. **Download the compiled payload** and transfer it to your Rubber Ducky’s storage.  
5. **Insert your Rubber Ducky into the target machine** and watch the magic happen. 💀

---

## **🚀 USAGE**

💣 **Insert the Rubber Ducky into a macOS target machine.**  
The payload will:

1. **Open Terminal.**  
2. **Run the exfiltration script in the background.**  
3. **Silently collect data.**  
4. **Exfiltrate it to your configured remote server.**  

---

## **🔐 EXFILTRATION CONFIGURATION**

Edit the **`silent_exfil.sh`** script to customize your exfiltration method. Available options:

| Method       | Configuration File / Token | Default Target  |
|--------------|----------------------------|-----------------|
| HTTPS        | `exfil.crt`                | `https://localhost:9999/upload` |
| SCP          | `exfil.pem`                | `scp_user@localhost:/tmp` |
| Dropbox API  | `dropbox_token`            | Dropbox account |
| Google Drive | `gdrive_token`             | Google Drive |
| AWS S3       | `aws_access_key` / `aws_secret_key` | S3 Bucket |
| GCS          | `gcs_token`                | Google Cloud Storage |

---

## **📋 DATA COLLECTION TARGETS**

The payload collects the following data:

- **📄 Files:** `.doc`, `.docx`, `.xls`, `.xlsx`, `.pdf`, `.ppt`, `.csv`, `.odt`  
- **🔐 Keychains:** macOS keychains from `~/Library/Keychains`  
- **🌐 Browser Profiles:** Chrome, Brave, Firefox, Safari  
- **🔑 SSH Keys:** `.ssh` directory  
- **🔒 GPG Keys:** `.gnupg` directory  
- **📶 Network Details:** Wi-Fi connections, IP addresses, active ports  
- **⚙️ System Configs:** Environment variables, `.bashrc`, `.zshrc`, `.gitconfig`  

---

## **💡 TIPS FOR STEALTH**

- **Obfuscate the script:** Use a tool like `shc` or `bash-obfuscate` to encrypt the bash script.  
- **Use a VPN:** Always route your exfil server traffic through a VPN or Tor.  
- **Spoof your USB device:** Change the Rubber Ducky’s USB descriptor to look like a **keyboard or webcam.**  
- **Avoid detection:** Use **low-profile exfiltration methods** (e.g., Dropbox API, Google Drive API).  

---

## **⚠️ DISCLAIMER**

This tool is for **educational purposes only**.  
We are not responsible for any misuse of this tool.  
By using this script, you agree to take full responsibility for your actions.

---

## **👻 AUTHOR**

**un1x01d** – _Digital Ghost. System Architect. Hacker Extraordinaire._  

> 💬 **“Silence is golden. Stealth is power.”**  

---

### **💀 Hack responsibly. Or don’t. 💀**
