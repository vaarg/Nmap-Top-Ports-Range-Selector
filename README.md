# Nmap Top Ports Range Selector

A bash script to generate comma-separated ranges of top ports for Nmap.

## Why?

We all know you can use `--top-ports 1500` on Nmap... 

But _what if_ we want to scan all the top ports from `1501-2000`? Or any other range of top ports?

Well this script generates ranges of top ports for you to be able to do that.

This is useful because if you've already scanned `--top-ports 1000` and you want to now scan the next 1000 usually you'd have to run `--top-ports 2000`. BUT this _already includes the top 1000 ports you've already scanned_ so this is a waste of time. 

This script saves you time!

## Usage

Display top ports between specified range:

    -r, --range [START]-[END]

Display top [NUMBER] of ports:
    
    -t, --top [NUMBER]

## Example:

    ./nmap-top-ports-range-selector -r 10-30

Generates a comma-separated list from the `10`-`30`th most frequent ports:

    139,143,53,135,3306,8080,1723,111,995,993,5900,1025,587,8888,199,1720,465,548,113,81,6001

Simply plug this into your `nmap` command:

    nmap <ip> -p 139,143,53,135,3306,8080,1723,111,995,993,5900,1025,587,8888,199,1720,465,548,113,81,6001

## Q&A

Q: Why not just merge TCP and UDP into one script?

A: Because I'm lazy. I'll try to get around to adding a `-u` flag or something.
