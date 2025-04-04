#!/usr/bin/python3
import hashlib
import os
import sys

buffer = ""
md5 = ""

def md5_hex(input_str):
    return hashlib.md5(input_str.encode('utf-8')).hexdigest()

def filter_open(email, page):
    global buffer, md5
    buffer = ""
    # Remove angle brackets if present and lowercase the email
    cleaned_email = email.strip('<>').lower()
    md5 = md5_hex(cleaned_email)

def filter_write(s):
    global buffer
    buffer += s

def filter_close():
    baseurl = "https://seccdn.libravatar.org/" if os.getenv("HTTPS") else "http://cdn.libravatar.org/"
    html = (
        f"<img src='{baseurl}avatar/{md5}?s=13&amp;d=retro' "
        "width='13' height='13' alt='Libravatar' /> "
        f"{buffer}"
    )
    print(html)
    return 0

# Optional: if used standalone or piped
if __name__ == "__main__":
    # Example usage:
    # echo "John Doe" | python3 email-libravatar.py "<john@example.com>"
    if len(sys.argv) < 2:
        print("Usage: email-libravatar.py <email>", file=sys.stderr)
        sys.exit(1)

    email = sys.argv[1]
    filter_open(email, None)
    for line in sys.stdin:
        filter_write(line)
    filter_close()