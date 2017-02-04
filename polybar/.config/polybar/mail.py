#!/usr/bin/env python

import imaplib
import json
import os


def main():
    try:
        with open(os.path.join(
                os.path.expanduser("~"),
                '.config',
                'polybar',
                'mail.json')) as f:
            login = json.load(f)
    except:
        return '!'

    M = imaplib.IMAP4_SSL('imap.gmail.com', '993')

    try:
        M.login(login['user'], login['password'])
        M.select()
        return len(M.search(None, 'UnSeen')[1][0].split())
    except imaplib.IMAP4.error:
        return '?'
    except:
        return '!'


if __name__ == "__main__":
    print(main())
