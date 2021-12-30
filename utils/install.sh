#!/usr/bin/env bash
sudo pkgfile --update
sudo systemctl enable --now plocate-updatedb.timer
sudo systemctl start plocate-updatedb.service
