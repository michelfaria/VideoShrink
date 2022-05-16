# Introduction


Video Shrinker is a small project is to provide the user with a quick and convenient video compression workflow in Windows and macOS environments. With these scripts, all you have to do is select a video, specify the size you'd like it to be and it'll be resized.

See [DISCLAIMER](#disclaimer).

## Table of Contents
- [Introduction](#introduction)
  - [Table of Contents](#table-of-contents)
- [Installing ffmpeg](#installing-ffmpeg)
  - [ffmpeg: Windows](#ffmpeg-windows)
    - [Installing ffmpeg on Windows with Chocolatey (easiest)](#installing-ffmpeg-on-windows-with-chocolatey-easiest)
    - [Installing ffmpeg on Windows manually (harder)](#installing-ffmpeg-on-windows-manually-harder)
  - [ffmpeg: macOS](#ffmpeg-macos)
    - [Installing ffmpeg on macOS with Homebrew](#installing-ffmpeg-on-macos-with-homebrew)
- [Usage](#usage)
  - [Windows](#windows)
  - [macOS](#macos)
- [DISCLAIMER](#disclaimer)



# Installing ffmpeg

This installation guide is written for folks who are not familiar with the command-line environment and environment variables. You may skip these instructions if you are familiar with those.

Before you can use these scripts, you will need to install **ffmpeg** - a suite of command-line tools for video and audio processing. If you know you already have ffmpeg installed, you do not need to install it again and may skip this installation step. If you're not sure if you've installed ffmpeg before, it should be safe to follow this installation guide anyhow.



## ffmpeg: Windows
### Installing ffmpeg on Windows with Chocolatey (easiest)

[Chocolatey](https://chocolatey.org/) is a package manager for Windows that can make the installation process more convenient by allowing us to install ffmpeg with only a few commands. 

1. **Install Chocolatey:** If you already have Chocolatey installed, skip this step. Open a PowerShell window with Administrative Privileges by hitting **![Win](https://upload.wikimedia.org/wikipedia/commons/a/ae/Windows_key_logo_2012_%28dark-grey%29.svg) + X**, then hitting **a**. Copy and paste the below code into the PowerShell window and then hit **Enter**:
    ```PowerShell
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    ```
    If you don't see any errors in the installation output, Chocolatey should now be installed. 

2. **Install ffmpeg:** In a PowerShell window with Administrative Privileges, type (or copy and paste) the command `choco install ffmpeg -y` and hit **Enter**. If there are no errors, ffmpeg is now installed.



### Installing ffmpeg on Windows manually (harder)



If you cannot (or don't want to) install Chocolatey, you may also install ffmpeg manually. Do note that ffmpeg does not come with an installer, so we can only install it manually. It is very easy to mess up this installation — follow these instructions down to the letter and double-check your spellings.

1.  **Download ffmpeg:** Go to https://github.com/BtbN/FFmpeg-Builds/releases. Upon opening the page, you will see a long list of items. Click on the item named **ffmpeg-master-latest-win64-gpl.zip** to download the ffmpeg archive. The download location does not matter, but choose a place where you will have easy access to, like for example, your Downloads folder. Once the download is complete, extract the archive.

2. **Put the ffmpeg files in a convenient place:** Go to the C:\ directory and create a folder named `ffmpeg`. Copy the contents of the `bin` folder in the archive you extracted and paste them inside the "ffmpeg" folder you created in C:\\. You should now have the files "ffmpeg.exe", "ffprobe.exe", and "ffplay.exe" in a folder called "ffmpeg" in the C:\ drive. 

3. **Open the Environment Variables editor:** Open "Run" dialog by hitting **![Win](https://upload.wikimedia.org/wikipedia/commons/a/ae/Windows_key_logo_2012_%28dark-grey%29.svg) + R**. In the dialog box that pops up, type or copy and paste the following command and hit **Enter**:
    ```
    rundll32 sysdm.cpl,EditEnvironmentVariables
    ```
    You should now see a window titled "Environment Variables", with two boxes labeled "User variables" and "System variables".

4. **Update the Path variable:** In the "User Variables" box, double-click the row that says "Path" in the "Variable" column. A window titled "Edit environment variable" should appear. Press the "New" button, type `C:\ffmpeg\` in the text field that appears and press **Enter** to finish typing. Press OK to close the "Edit environment variables" window. Press OK again to close the "Environment variables" window.

5. **Testing installation:** Hit **![Win](https://upload.wikimedia.org/wikipedia/commons/a/ae/Windows_key_logo_2012_%28dark-grey%29.svg) + R** to open the "Run" dialog again. In the text box, write `ffmpeg` and hit **Enter**. If ffmpeg was installed **correctly**, you should see a black window (a command prompt window) open up for a second and then close itself.  Congratulations - ffmpeg is now installed and you are now ready to run these scripts.

    If ffmpeg was installed **incorrectly**, you will see a window that says "Windows cannot find 'ffmpeg'. Make sure you typed the name correctly, and then try again." Start over from step 1 and make sure you didn't miss anything. If you haven't already, consider using the Chocolatey installation method.



## ffmpeg: macOS
### Installing ffmpeg on macOS with Homebrew

[Homebrew](https://brew.sh) is a package manager for Windows that can make the installation process more convenient by allowing us to install ffmpeg with only a few commands. 

1. **Install Homebrew:** Open the Terminal and copy and paste the following command and hit **Enter**.
    ```Bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```
    If there were no errors during installaton, homebrew should now be installed.

2. **Install ffmpeg:** In the terminal, run `brew install ffmpeg`. If there were no errors during installation, ffmpeg should now be installed.

# Usage
## Windows

1. **Download the script.** Download `shrink.bat` (the script) from this repository.
2. **Choose a video.** Drag and drop any video you'd like to shrink onto the script.
3. **Enter desired size.** You will be prompted for how big you'd like your video, in megabytes. *Due to Windows batch script limitations, only whole, positive numbers are supported.*
4. **Done!** The shrunk video will be created in the save folder as the original video.

## macOS

1. **Download the Automator workflow**. Download the "Shrink Video.workflow".
2. **Install the workflow.** Double-click it to install.
3. **Choose a video.** Right click any video and click "Shrink video".
4. **Enter desired size.** You will be prompted for how big you'd like your video, in megabytes.
5. **Done!** The shrunk video will be created in the save folder as the original video.

# DISCLAIMER

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

