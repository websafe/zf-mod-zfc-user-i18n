#!/bin/bash
# Buildscript collects all translations from single-language
# modules (listed in composer.json -> require) and builds
# a single module containing all available translations.
#
SCRIPT_DIR=$(dirname ${0})
PROJECT_ROOT=${SCRIPT_DIR}/../..
#
LOCALES="de_DE,ja_JP,pl_PL"

#
set -e

#
cd ${PROJECT_ROOT}

# Cleaning up
if [ -d ./config ];
then
    rm -rvf ./config;
fi;
if [ -d ./language ];
then
    rm -rvf ./language;
fi;
if [ -d ./vendor ];
then
    rm -rvf ./vendor;
fi;
if [ -r ./composer.lock ];
then
    rm -f ./composer.lock;
fi;

#
ls -la

# Composer update - installs all single-language modules in vendor
composer update

# Create config dir
if [ ! -d ./config ];
then
    mkdir ./config
fi

# Create dir for language files
if [ ! -d ./language ];
then
    mkdir ./language
fi

# Starting config/module.conf.php
echo -e "<?php\n" >> config/module.config.php
echo -e "namespace WebsafeZfModZfcUserI18n;\n" >> config/module.config.php
echo "return array(" >> config/module.config.php
echo "    'translator' => array(" >> config/module.config.php
echo "        'translation_files' => array(" >> config/module.config.php

# Extracting language files from single-language modules in vendor
# and copying to ./labguage and compiling to .po
for currentlocale in $(echo $LOCALES | tr "," "\n")
do
    localeasmodulesuffix=$(
	echo $currentlocale \
	    | tr "_" "-" \
	    | tr \
	        "ABCDEFGHIJKLMNOPQRSTUVWXYZ" \
	        "abcdefghijklmnopqrstuvwxyz";
    );
    #
    modulepath="vendor/websafe/zf-mod-zfc-user-i18n-${localeasmodulesuffix}"
    #
    if [ -r ${modulepath}/language/${currentlocale}.po ];
    then
	# Copying from single-language module to this module
	cp -v ${modulepath}/language/${currentlocale}.po ./language/
	# Compilink .po file
	msgfmt -cv -o language/${currentlocale}.mo language/${currentlocale}.po
	# Adding section for current locale in module.conf.php
	echo "            array(" >> config/module.config.php
	echo "                'type'     => 'gettext'," >> config/module.config.php
	echo "                'filename' => __DIR__ . '/../language/${currentlocale}.mo'," >> config/module.config.php
	echo "                'locale'   => '${currentlocale}'" >> config/module.config.php
	echo "            )," >> config/module.config.php
    fi
done

# Finishing module.conf.php
echo "        )," >> config/module.config.php
echo "    )," >> config/module.config.php
echo ");" >> config/module.config.php

#
echo "Buildscript ready, now review and submit built module to repo."
