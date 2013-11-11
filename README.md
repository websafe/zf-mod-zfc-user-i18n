WebsafeZfModZfcUserI18n
================================================================================

[![Build Status](https://travis-ci.org/websafe/zf-mod-zfc-user-i18n.png?branch=master)](https://travis-ci.org/websafe/zf-mod-zfc-user-i18n)

Multi language pack module for the ZF-Commons/ZfcUser module.

Currently contains following languages/locales/translations:

 + **[de_DE]**: [report an issue with de_DE] | [edit de_DE.po]
 + **[ja_JP]**: [report an issue with ja_JP] | [edit ja_JP.po]
 + **[pl_PL]**: [report an issue with pl_PL] | [edit pl_PL.po]

Each translation is located in a separate repository (linked above).
This module (WebsafeZfModZfcUserI18n) simply collects all `.po` files from
coresponding single-language repositories during the build process.

For details about the build process see this repositories 
`composer.json` -> `require-dev` and `scripts/build/build.sh`.


* * *


 + [Installation](#installation)
 + [Configuration](#configuration)
 + [Updating](#updating)
 + [Contributing](#contributing)
 + [Compiling](#compiling-po-files-to-mo-files)


* * *



Installation
--------------------------------------------------------------------------------

Chdir into Your projects root directory (where `composer.json` resides)
and run the following command:

~~~~ bash
composer require websafe/zf-mod-zfc-user-i18n:dev-master --prefer-dist
~~~~



Configuration
--------------------------------------------------------------------------------

### Enabling the multi language pack module in Your ZF2 application

In `config/application.conf.php` add `WebsafeZfModZfcUserI18n` after
`ZfcUser`:

~~~~ php
<?php
return array(
    'modules' => array(
        // ...
        'ZfcUser',
        'WebsafeZfModZfcUserI18n',
        // ...
    ),
    // ...
);
~~~~



#### Set the locale

This step is not really required - it depends on how the locale is initialized
in Your application. 

In `config/global.conf` or `module/Application/config/module.config.php` add:

~~~~ php
    // ...
    'translator' => array(
        'locale'  => 'AVAILABLE_LOCALE',
        // ...
    ),
    // ...
~~~~

Replace `AVAILABLE_LOCALE` with `de_DE`, `ja_JP` or `pl_PL`. See list of 
available translations at the [top of this README].



Updating
--------------------------------------------------------------------------------

Chdir into projects root directory (where `composer.json` resides)
and run the following commands:

~~~~ bash
rm -rf ~/.composer/cache/files/websafe/zf-mod-zfc-user-i18n*
composer update websafe/zf-mod-zfc-user-i18n
~~~~

The `rm -rf ...` part is needed when the module was installed with 
`--prefer-dist`. Without cleaning up the cache before installing - [Composer]
will probably stick to a cached version.



Contributing
--------------------------------------------------------------------------------

If You want to help with translation, just:

 + [edit de_DE.po]
 + [edit ja_JP.po]
 + [edit pl_PL.po]

and after all send a pull request.


When You're not familiar with editing `.po` files - simply:

 + [report an issue with de_DE]
 + [report an issue with ja_JP]
 + [report an issue with pl_PL]


If You want to add a new language:

 + [report an issue] and I will create a repo for Your language, compatible
   with existing single-language module repos.



Compiling .po files to .mo files
--------------------------------------------------------------------------------

There's no need to compile `.po` files after the installation or before sending 
pull requests, but if you modify the `.po` file locally, recompile it by 
executing the following command in this modules root directory:

~~~~ bash
msgfmt -cv -o language/de_DE.mo language/de_DE.po
~~~~



[ZF-Commons/ZfcUser]: https://github.com/ZF-Commons/ZfcUser "ZfcUser is a user registration and authentication module for Zend Framework 2."
[Composer]: http://getcomposer.org/ "Dependency Manager for PHP"
[edit de_DE.po]: https://github.com/websafe/zf-mod-zfc-user-i18n-de-de/edit/master/language/de_DE.po
[edit ja_JP.po]: https://github.com/websafe/zf-mod-zfc-user-i18n-ja-jp/edit/master/language/ja_JP.po
[edit pl_PL.po]: https://github.com/websafe/zf-mod-zfc-user-i18n-pl-pl/edit/master/language/pl_PL.po
[report an issue]: https://github.com/websafe/zf-mod-zfc-user-i18n/issues/new
[de_DE]: https://github.com/websafe/zf-mod-zfc-user-i18n-de-de "German de_DE translation / language pack module for the ZF-Commons/ZfcUser module."
[ja_JP]: https://github.com/websafe/zf-mod-zfc-user-i18n-ja-jp "Japanese ja_JP translation / language pack module for the ZF-Commons/ZfcUser module."
[pl_PL]: https://github.com/websafe/zf-mod-zfc-user-i18n-pl-pl "Polish pl_PL translation / language pack module for the ZF-Commons/ZfcUser module."
[report an issue with de_DE]: https://github.com/websafe/zf-mod-zfc-user-i18n-de-de/issues/new
[report an issue with ja_JP]: https://github.com/websafe/zf-mod-zfc-user-i18n-ja-jp/issues/new
[report an issue with pl_PL]: https://github.com/websafe/zf-mod-zfc-user-i18n-pl-pl/issues/new
[top of this README]: #websafezfmodzfcuseri18n
