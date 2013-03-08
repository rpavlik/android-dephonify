@echo off
REM Part of https://github.com/rpavlik/android-dephonify

REM License: http://opensource.org/licenses/mit-license.html

REM Copyright (c) 2013 Ryan Pavlik <rpavlik@acm.org>

REM Permission is hereby granted, free of charge, to any person obtaining a 
REM copy of this software and associated documentation files (the 
REM "Software"), to deal in the Software without restriction, including 
REM without limitation the rights to use, copy, modify, merge, publish, 
REM distribute, sublicense, and/or sell copies of the Software, and to 
REM permit persons to whom the Software is furnished to do so, subject to 
REM the following conditions: 

REM The above copyright notice and this permission notice shall be included 
REM in all copies or substantial portions of the Software. 

REM THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
REM OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
REM MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
REM IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
REM CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
REM TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
REM SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 

pushd "%~dp0"
echo WARNING: This script will actually delete, not just rename, the packages
echo related to phone service. The only way to undo this script is to re-flash
echo your system ROM.  If you don't want to do this, this is your last chance to
echo cancel with Ctrl-C or closing the window.

pause

call "common.cmd" delete