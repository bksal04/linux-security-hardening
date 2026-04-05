# Remediation Notes

## Common Findings
- Password authentication enabled in SSH
- Root login permitted over SSH
- Unused services listening on external interfaces
- No host firewall configured

## Remediation Actions
- Changed SSH to key-based access only
- Disabled direct root login
- Enabled and verified UFW default deny for inbound traffic
- Deployed Fail2Ban for SSH protection
- Reviewed open services and removed anything unnecessary
