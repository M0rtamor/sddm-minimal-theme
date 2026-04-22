# Minimal theme for sddm

Simple theme for sddm for a single user.

## Preview:

![empty](Preview/empty-preview.png)
![filled](Preview/filled-preview.png)

## Installation:

### Via install.sh:

```
git clone https://github.com/M0rtamor/sddm-minimal-theme.git
cd sddm-minimal-theme
chmod +x install.sh
sudo install.sh <your_username>
```

### Manual install:

- in `minimal/theme.conf`, change `userName=name` to `userName=<your_username>`
- move `minimal/` into `usr/share/sddm/themes/`
- inside `/etc/sddm.conf` or `/etc/sddm.conf.d/theme.conf` add:

```
[Theme]
Current=minimal
```

##  Changing the background:

- replace `minimal/background.png` by your background, also call this `background.png`
