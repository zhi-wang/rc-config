# name resolving is VERY slow

# similar discussions are here
# https://github.com/systemd/systemd/issues/10298

# a fix is
# sudo ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
# from
# https://github.com/systemd/systemd/issues/10298#issuecomment-427588564
