android-dephonify
=================

Turns a rooted Android phone without service into a suspiciously phone-shaped Android tablet by disabling all phone functionality.

Requirements
------------
- You need `adb` installed.
- You need root on your phone and set up so `adb shell` shows a `#` right away, not a `$`.
- **You need to understand that this disables all phone functionality, including emergency calling, and be OK with that.**

About
-----
There's nothing really too special about this script. The command file just has some `adb` commands to upload a shell script to your phone and run it.  That shell script looks for any packages in a list I've developed that is fairly complete, of things that don't work if you have no hone service. It then renames them (from `foo.apk` to `Oldfoo.apk.old`) so that the Android system can't use them.

Of course, this won't survive a flashing of a new system ROM, so you'll have to re-run it.

This worked for me on an HTC Inspire 4G originally from AT&T. Haven't tested it elsewhere.  Mandatory disclaimer about breaking your phone applies, especially since this intentionally breaks the phone-part of the phone.  If it breaks, you get to keep both pieces.

Usage
-----
Run the `disablephone.cmd` file in Windows. (If you're on Linux, this is an easy one to translate since it's 2/3 messages to the user.)

License
-------
[MIT License](http://opensource.org/licenses/mit-license.html)

> Copyright (c) 2013 Ryan Pavlik <rpavlik@acm.org>

> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.