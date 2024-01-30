# Nmap Top Ports Range Selector

A bash script to generate comma-separated ranges of top ports for Nmap.

## Why?

We all know you can use `--top-ports 1500` on Nmap, but _what if_ we want to scan all the top ports from `1501-2000`? Or any other range?

Well this script generates ranges of top ports for you to be able to do that.

## Usage

Display top [NUMBER] of ports (separated by commas):
    
    -t, --top [NUMBER]

Display top ports between specified range (separated by commas):

    -r, --range [START-END]t

## Example:

    ./nmap-top-ports-range-selector -r 10-30

Generates a comma-separated list from the `10`-`30`th most frequent ports:

    139,143,53,135,3306,8080,1723,111,995,993,5900,1025,587,8888,199,1720,465,548,113,81,6001

Simply plug this into your `nmap` command:

    nmap <ip> -p 139,143,53,135,3306,8080,1723,111,995,993,5900,1025,587,8888,199,1720,465,548,113,81,6001

## Q&A

Q: Why not just merge TCP and UDP into one script?

A: Because I'm lazy. I'll try to get around to adding a `-u` flag or something.
