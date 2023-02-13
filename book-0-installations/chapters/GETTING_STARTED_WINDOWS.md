# Installations

## Visual Studio Code

Visit the [Visual Studio Code](https://code.visualstudio.com/) website to download and install the code editor. This is the editor you will be using for the next 6 months.

## Git Bash (i.e. the terminal)

Later in the instructions, we will ask you to type a command into your terminal. For Windows, this is the **Git Bash** application.

Visit the [Git Bash](http://www.git-scm.com/downloads) download page click the "Download for Windows" button, and once complete, install the software.

## Windows Terminal Preview

Visit the [Windows Terminal Preview](https://www.microsoft.com/en-us/p/windows-terminal-preview/9n8g5rfz9xk3?cid=msft_web_chart&activetab=pivot:overviewtab) download page and open it in the Microsoft Store App. This will be your default terminal which you will use to navigate your file system, and run development tools throughout the course.

Once Windows Terminal Preview is installed:

1. Go to the `Start` menu (Windows key)
2. Search for `Windows Terminal Preview`
3. Open `Windows Terminal Preview`
4. By default, this will open a new PowerShell terminal window. _Do **not** use the PowerShell terminal window._
5. Click the down arrow <kbd>﹀</kbd> located at the top of the terminal window.
6. Select **Git Bash** from the dropdown menu to start a new **Git Bash** terminal window.

>##### _NOTE: **Always** use Git Bash, not PowerShell._

## Node

Visit the [Node.js](https://www.nodejs.org) site and click on the install button that has **"LTS"** in it. Once you download the software, install it, accepting all of the defaults along the way.

## Node Packages - Web and API Servers

1. Open Windows Terminal Preview and start a new **Git Bash** terminal window.
1. Run the following command in the terminal to install both `serve` and `json-server`:
    ```sh
    npm i -g serve json-server
    ```
