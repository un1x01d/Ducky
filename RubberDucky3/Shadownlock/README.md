# 💀 **ShadowLock: The Silent Reaper with a Rubber Ducky Twist** 💀  
_"Security is a myth. All it takes is one mistake."_  

---

## ⚠️ **What Is ShadowLock?**

ShadowLock is **a stealth ransomware tool** that operates **silently and without leaving a trace.** It takes full control of a system, **encrypts critical files in-memory**, **wipes the originals**, and **leaves no breadcrumbs** for forensic tools to trace.  

This isn’t about holding files hostage for ransom.  
It’s about **showing how fragile security really is.**

And how does it get in?  
With a **simple USB device**—a **Rubber Ducky.**

---

## 🦆 **How the Rubber Ducky Payload Works**

The **Rubber Ducky** is a **custom USB device** designed to mimic a keyboard. When plugged into a system, it **injects pre-configured commands** faster than any human could type.

Here’s how it goes down:

1. **The Rubber Ducky is inserted into a macOS machine.**  
2. **It automatically opens Terminal in the background.**  
3. **ShadowLock launches, disguises itself as a legitimate macOS process, and begins encrypting files.**  
4. **Files are securely deleted and replaced with encrypted versions.**  
5. **All traces of the operation are wiped from memory.**

**No pop-ups. No warnings. No admin prompts.**  

By the time the user notices, **the damage is done.**

---

## 🔐 **Key Features of ShadowLock**

| **Feature**                                   | **Benefit**                                                                                             | **Stealthiness** | **Evasion Effectiveness**                                                                     |
|-----------------------------------------------|-------------------------------------------------------------------------------------------------------|------------------|----------------------------------------------------------------------------------------------|
| Dynamic Process Name Rotation                 | Disguises the script as legitimate macOS processes to avoid detection by process monitoring tools.      | High             | Avoids detection by process monitoring tools like CrowdStrike Falcon and Jamf Pro.           |
| In-Memory Encryption                          | Ensures no intermediate files are created on disk, minimizing forensic traces.                          | High             | Bypasses disk-based forensic tools and signature-based antivirus solutions.                  |
| Randomized Delays Between Batches             | Makes the encryption process less predictable and harder to detect by behavioral analysis tools.        | Medium           | Reduces the likelihood of detection by behavioral analysis tools like SentinelOne and Sophos. |
| File Renaming Before Encryption               | Prevents detection by tools that monitor file deletions, making encryption appear more legitimate.      | Medium           | Makes encryption look like a legitimate file modification, bypassing deletion monitoring tools. |
| Obfuscated Encryption Command                 | Hides the use of known encryption tools from security tools that monitor shell commands.                | High             | Hides encryption activity from security tools that detect known commands.                    |
| Extensive Decoy Commands                     | Covers ShadowLock’s activity with typical macOS system commands to blend with normal system behavior.   | High             | Blends with normal macOS background activity, reducing anomaly detection risk.               |
| No Temporary Files                            | Prevents any temporary files from being written to disk, avoiding disk-level forensic analysis.         | High             | Eliminates any traces left on disk, reducing the chances of forensic recovery.               |
| Randomized Batch Processing                   | Distributes file encryption across multiple CPU threads, speeding up the process while remaining stealthy. | Medium        | Makes the script’s behavior less predictable to security tools, reducing detection likelihood. |
| Clearing Bash History and Environment Variables | Removes any trace of the script’s execution from memory and shell history.                              | High             | Removes traces from memory and environment variables, preventing forensic analysis.          |

---

## 💻 **Why macOS Security Tools Missed It**

ShadowLock is designed to **bypass both built-in macOS protections and enterprise security tools.** Here’s why those tools **failed to detect it.**

| **Tool**                  | **Detection Likelihood** | **Why It Fails**                                             |
|---------------------------|--------------------------|-------------------------------------------------------------|
| Gatekeeper                | **Low**                  | Doesn’t check for keyboard-based attacks via USB devices.    |
| XProtect                  | **Low**                  | Relies on known malware signatures. ShadowLock is custom.    |
| SentinelOne               | **Low**                  | Behavioral analysis struggles with randomized, in-memory encryption. |
| CrowdStrike Falcon        | **Low**                  | ShadowLock’s process masquerading avoids detection.          |
| Sophos Intercept X        | **Low**                  | Encryption patterns are disguised behind random delays and decoy commands. |
| Jamf Pro                  | **Low**                  | Compliance checks don’t flag ShadowLock’s process names.     |
| Red Canary Mac Monitor    | **Low**                  | Blends with normal macOS activity, leaving no anomalies to detect. |

---

## 💀 **What Happens Next?**

Here’s the brutal truth:  
**Your files are gone.**  
The encryption key? **Stored on the Rubber Ducky.**  
No ransom. No demands. Just **silence.**  

You might ask yourself, _“Why would someone do this?”_  
Because **this isn’t about money.**  
It’s about proving a point: **Your security isn’t as solid as you think.**

---

## 🧪 **Want to Test It?**

Feeling curious?  
Run ShadowLock in a **controlled environment** and see how your system holds up.  

Here’s what you’ll need:

1. **A macOS Virtual Machine.**  
2. **A Rubber Ducky device loaded with the ShadowLock payload.**  
3. **An endpoint detection tool to see what it catches (spoiler: probably nothing).**  

---

## ⚠️ **Disclaimer (Because We Have To)**

This tool is for **educational purposes only.**  
The goal is to highlight **security gaps** and **raise awareness** about **social engineering attacks** using devices like the Rubber Ducky.

---

## 🎩 **Final Thoughts: Welcome to the Shadows**

- **Never trust random USB devices.**  
- **Lock your machine.**  
- **And don’t assume your security tools are enough.**  

Because **the next ShadowLock** might not be for awareness.  
It might be **for real.**

💀 **ShadowLock: Silent, Stealthy, and Deadly.**

