# Hardening Methodology

## Areas Reviewed
- Remote access exposure
- Running services
- Host firewall posture
- Brute-force resistance
- Basic account and authentication settings

## Controls Applied
- Disable SSH root login
- Prefer SSH key-based access over passwords
- Enable a default-deny inbound firewall policy
- Use Fail2Ban to reduce brute-force risk
- Review listening services and disable anything unnecessary

## Validation
- Confirm SSH settings are applied
- Confirm only approved ports are open
- Confirm Fail2Ban is active for SSH
- Record audit script output before and after remediation
