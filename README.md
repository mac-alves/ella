<h1 align="center" style="display: flex;">
  <img wi alt="ChatNode" height="300" src="https://res.cloudinary.com/dpf7e7tpc/image/upload/v1610842427/projetos/ella/app_lists-ella_kq4jcd.gif" />
  <img wi alt="ChatNode" height="300" src="https://res.cloudinary.com/dpf7e7tpc/image/upload/v1610842426/projetos/ella/app_money-ella_gc0wq9.gif" />
  <img wi alt="ChatNode" height="300" src="https://res.cloudinary.com/dpf7e7tpc/image/upload/v1610842426/projetos/ella/app_password-ella_az6key.gif" />
  <img wi alt="ChatNode" height="300" src="https://res.cloudinary.com/dpf7e7tpc/image/upload/v1610842434/projetos/ella/app_shooping-ella_dwyjvj.gif" />
</h1>

<h1 align="center">
  Ella - Super management app
</h1>
<h3 align="center">System developed for offline management of lists, passwords, quotes and purchases</h3>
<br/>
<p align="center">
  <img alt="GitHub language count" src="https://img.shields.io/github/languages/count/mac-alves/ella">

  <img alt="GitHub top language" src="https://img.shields.io/github/languages/top/mac-alves/ella">

  <img alt="GitHub repo size" src="https://img.shields.io/github/repo-size/mac-alves/ella">

  <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/mac-alves/ella">

  <img alt="GitHub" src="https://img.shields.io/github/license/mac-alves/ella">
</p>

<p align="center">
  <a href="#rocket-technologies">Technologies</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#bangbang-dependencies">Dependencies</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#information_source-how-to-use">How To Use</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#red_circle-improvements-to-be-made">Improvements to be made</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#memo-license">License</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#memo-license">Autor</a>
</p>

## :rocket: &nbsp;&nbsp;&nbsp; Technologies

This project was developed with the following technologies:

-  [Flutter](https://flutter.dev/)
-  [Mobx](https://pub.dev/packages/mobx)
-  [Slidy](https://github.com/Flutterando/slidy)
-  [Hive](https://docs.hivedb.dev/#/)
-  [Dio](https://pub.dev/packages/dio)
-  [Vscode](https://code.visualstudio.com/)

## :bangbang: &nbsp;&nbsp;&nbsp; Dependencies

- [Git](https://git-scm.com),
- [Flutter v1.22.2](https://flutter.dev/) 
- [Slidy v2.2.1](https://github.com/Flutterando/slidy)

## :information_source: &nbsp;&nbsp;&nbsp; How To Use

```bash
# Clone this repository
$ git clone https://github.com/mac-alves/ella.git

# Go into the repository
$ cd ella/

# Install dependencies
$ flutter pub get

# build clean mobx
$ slidy run mobx_watch

# run on your emulator
$ -- varied command

# build
$ flutter build appbundle

# generate build apk
$ flutter build apk --split-per-abi

# install on device
$ flutter install
```

## :red_circle: &nbsp;&nbsp;&nbsp; Improvements to be made

- Create a changelog screen
- `app money `: 
    - Create a type of "reserved" expense for amounts that must be separated for future spending, saved on savings.
    - in the option to exclude from the "home" screen, create a select to select the budget
    - inform that there is already a budget if you select a month of the same year already registered
    - set the selected month on the period date pick
- `app password `:
    - Create authentication system with the manager
    - Check the feasibility of adding the username field for passwords
- `app lists `:
    - implement enumerated lists

## :memo: &nbsp;&nbsp;&nbsp; License
This project is under the MIT license. See the [LICENSE](https://github.com/mac-alves/ella/blob/main/LICENSE) for more information.

---

## Autor

:anchor: &nbsp;&nbsp; **Mauricio Alves** - *Github* - [mac-alves](https://github.com/mac-alves)


[nodejs]: https://nodejs.org/
[npm]: https://www.npmjs.com/
[vc]: https://code.visualstudio.com/
[vceditconfig]: https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig
[vceslint]: https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint