#!/usr/bin/env bash
set -u

echo "=== Basic Linux Security Audit ==="
echo

echo "[1] Hostname"
hostname

echo

echo "[2] Kernel Version"
uname -r

echo

echo "[3] SSH Root Login Setting"
if [ -f /etc/ssh/sshd_config ]; then
    grep -Ei '^PermitRootLogin' /etc/ssh/sshd_config || echo "PermitRootLogin not explicitly set"
else
    echo "/etc/ssh/sshd_config not found"
fi

echo

echo "[4] SSH Password Authentication Setting"
if [ -f /etc/ssh/sshd_config ]; then
    grep -Ei '^PasswordAuthentication' /etc/ssh/sshd_config || echo "PasswordAuthentication not explicitly set"
else
    echo "/etc/ssh/sshd_config not found"
fi

echo

echo "[5] UFW Status"
if command -v ufw >/dev/null 2>&1; then
    ufw status verbose
else
    echo "UFW not installed"
fi

echo

echo "[6] Fail2Ban Status"
if command -v fail2ban-client >/dev/null 2>&1; then
    fail2ban-client status
else
    echo "Fail2Ban not installed"
fi

echo

echo "[7] Listening TCP Services"
if command -v ss >/dev/null 2>&1; then
    ss -tulpn
else
    netstat -tulpn 2>/dev/null || echo "Neither ss nor netstat available"
fi

echo

echo "[8] Accounts with UID 0"
awk -F: '($3 == 0) {print $1}' /etc/passwd

echo

echo "[9] Last 10 Failed Login Entries"
if [ -f /var/log/auth.log ]; then
    grep -i 'failed password' /var/log/auth.log | tail -n 10
else
    echo "/var/log/auth.log not accessible or not present"
fi

echo

echo "=== Audit Complete ==="
