#!/usr/bin/env bash 

# Hello! I bodged this script together at 2am, don't expect this to be good.

# Setup
mkdir -p tmp dist

# Download
wget "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-ASN&license_key=$MAXMIND_LICENSE_KEY&suffix=tar.gz" -O tmp/GeoLite2-ASN.tar.gz
wget "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-ASN-CSV&license_key=$MAXMIND_LICENSE_KEY&suffix=zip" -O tmp/GeoLite2-ASN-CSV.zip

wget "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City&license_key=$MAXMIND_LICENSE_KEY&suffix=tar.gz" -O tmp/GeoLite2-City.tar.gz
wget "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City-CSV&license_key=$MAXMIND_LICENSE_KEY&suffix=zip" -O tmp/GeoLite2-City-CSV.zip

wget "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-Country&license_key=$MAXMIND_LICENSE_KEY&suffix=tar.gz" -O tmp/GeoLite2-Country.tar.gz
wget "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-Country-CSV&license_key=$MAXMIND_LICENSE_KEY&suffix=zip" -O tmp/GeoLite2-Country-CSV.zip

# Extract
tar -C tmp -xvf tmp/GeoLite2-ASN.tar.gz
unzip -d tmp tmp/GeoLite2-ASN-CSV.zip

tar -C tmp -xvf tmp/GeoLite2-City.tar.gz
unzip -d tmp tmp/GeoLite2-City-CSV.zip

tar -C tmp -xvf tmp/GeoLite2-Country.tar.gz
unzip -d tmp tmp/GeoLite2-Country-CSV.zip

# Dist
cp tmp/**/*.csv dist/
cp tmp/**/*.mmdb dist/