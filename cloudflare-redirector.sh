#!/bin/bash
#Quickly create cloudflare workers that foward HTTP traffic to your servers!
#@Arokota

target=""
count=""
list=""

set_options() {
#       sed -i "s/[changeme]/$target/" ./wranger.toml
        echo "What is your account_id: "
        read account_id
        echo "What is your endpoint domain?"
        read domain
        echo "name = 'test'" >> wrangler.toml
        echo "type = 'javascript'" >> wrangler.toml
        echo "account_id = '$account_id'" >> wrangler.toml
        echo "workers_dev = true" >> wrangler.toml
        echo "route = ''" >> wrangler.toml
        echo "zone_id = ''" >> wrangler.toml
        echo "vars = { TS = '$target', WORKER_ENDPOINT = 'test.$domain.workers.dev' }""" >> wrangler.toml

        echo "[!] wrangler.toml created"
}



help() { 
    echo "Usage:"
    echo " "
    echo "./cloudflare-redirector.sh -t 127.0.0.1 -c 2"
    echo " "
    echo "Commands:"
    echo "  -t <target-c2-server>"
    echo "  -c <number of redirectors>"
    echo "  -h <displays this menu>"
    echo "  -l <file containing preferred subdomains>"
    echo "      Note: This file must contain the equivalent number of names as the number of redirectors desired"
    echo "      IE: ./cloudflare-redirector.sh -t 127.0.0.1 -c 2 -l /home/root/target_subdomains.txt"
    echo " "
    echo " "
    echo "Make sure you following the installation instructions from README.md before running this script."
    echo "I'm not responsible for anything you do outside of those instructions :) "
}

while getopts ":hm:r:t:c:d" opt; do
    case ${opt} in
        h ) help; exit;;
        t ) target=$OPTARG;;
        c ) count=$OPTARG;;
        l ) list=true;;
        \? ) echo "Invalid Option: -$OPTARG" >&2; exit 1;;
        : ) echo "Invalid Option: -$OPTARG requires an argument" >&2; exit 1;;
        esac
    done
    shift $((OPTIND -1))

if [[ -z $target && -z $count && -z $count ]]
then
        help;
else
        if [[ -f "./wrangler.toml" ]]
        then
                echo "[+] wrangler.toml found"
                wrangler publish
        else
                echo "[-] wrangler.toml not found"
                set_options;
                wrangler publish
        fi
fi