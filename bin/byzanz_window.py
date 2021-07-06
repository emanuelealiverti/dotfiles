#!/usr/bin/env python3
"""
Use byzanz to create a GIF screencast of a specific window.

Required tools:
sudo apt-get install byzanz x11-utils xdotool

A tip: use an extra-long duration (-d 100), record your shot, and use
gimp to shorten the duration of the last frame. You need to rename the layer
from "Frame 123 (100000 ms) (combine)" to "Frame 123 (1000 ms) (combine)".
"""

import sys
from subprocess import check_call, check_output, call
import re

def byzanz_window(filename, duration=10, delay=1, is_cursor=False,
                  is_audio=False, is_verbose=False):
    print("Select the window you like to capture.")
    winid = check_output('xdotool selectwindow'.split()).strip()

    wininfo = check_output(['xwininfo', '-id', winid]).decode(sys.stdout.encoding)

    x = int(re.search(r'Absolute upper-left X:\s*(\d+)', wininfo).group(1))
    y = int(re.search(r'Absolute upper-left Y:\s*(\d+)', wininfo).group(1))
    width = int(re.search(r'Width:\s*(\d+)', wininfo).group(1))
    height = int(re.search(r'Height:\s*(\d+)', wininfo).group(1))

    print("Press enter when you are ready to capture.")
    print("You'd have to activate the window in " + str(delay) + " seconds.")
    input()

    # check_call(['xdotool', 'windowactivate', winid])

    byzanz_args = ['-d', str(duration), '--delay='+str(delay)]
    if is_cursor: byzanz_args.append('-c')
    if is_audio: byzanz_args.append('-a')
    if is_verbose: byzanz_args.append('-v')
    byzanz_args.append(filename)

    args = ['byzanz-record', '-x', str(x), '-y', str(y),
            '-w', str(width), '-h', str(height)] + byzanz_args
    if is_verbose:
        print(' '.join(args), file=sys.stderr)

    r = call(args)
    return r

def main():
    import argparse
    parser = argparse.ArgumentParser(description='Call byzanz to capture a window.')
    parser.add_argument('filename', help='GIF file name to save')
    parser.add_argument('-d', '--duration', metavar='SECS', type=int, default=10,
                       help='Duration of animation (default: %(default)s seconds)')
    parser.add_argument('--delay', metavar='SECS', type=int, default=2,
                        help='Delay before start (default: %(default)s seconds)')
    parser.add_argument('-c', '--cursor', action='store_true',
                        help='Record mouse cursor')
    parser.add_argument('-a', '--audio', action='store_true',
                        help='Record audio')
    parser.add_argument('-v', '--verbose', action='store_true',
                        help='Be verbose')
    args = parser.parse_args()

    sys.exit(byzanz_window(args.filename, args.duration, args.delay, args.cursor,
                           args.audio, args.verbose))

if __name__ == '__main__':
    main()
