################################################################################
##
## photivo
##
## Copyright (C) 2008 Jos De Laender
## Copyright (C) 2010 Michael Munzert <mail@mm-log.com>
##
## This file is part of photivo.
##
## photivo is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License version 3
## as published by the Free Software Foundation.
##
## photivo is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with photivo.  If not, see <http://www.gnu.org/licenses/>.
##
################################################################################

######################################################################
#
# This is the Qt project file for photivo.
# Don't let it overwrite by qmake -project !
# A number of settings is tuned.
#
# qmake will make a platform dependent makefile of it.
#
######################################################################

# Check for qmake version
contains($$[QMAKE_VERSION],^2*) {
  message("Cannot build Photivo with qmake version $$[QMAKE_VERSION].")
  error("Use qmake from Qt4")
}

# Check for Qt version
contains(QT_VERSION, ^4\\.[0-5]\\..*) {
  message("Cannot build Photivo with Qt version $${QT_VERSION}.")
  error("Use at least Qt 4.6.")
}

CONFIG += release silent
#CONFIG += debug silent
TEMPLATE = subdirs

isEmpty(PREFIX) {
  PREFIX = $$[QT_INSTALL_PREFIX]
}

# Folder where all created object and binary files are put
# If user defined, no dot use spaces in the name!
win32 {
  isEmpty(BUILDDIR) {
    BUILDDIR = build
  }
  !exists( $${BUILDDIR} ) {
    RETURN = $$system(mkdir $${BUILDDIR})
  }
  RETURN = $$system(touch ./builddir && rm ./builddir && echo $${BUILDDIR} >> ./builddir)
}

# Hack to clean old makefiles
unix {
  RETURN = $$system(touch ./photivoProject/Makefile && rm ./photivoProject/Makefile)
  RETURN = $$system(touch ./ptClearProject/Makefile && rm ./ptClearProject/Makefile)
  RETURN = $$system(touch ./ptGimpProject/Makefile && rm ./ptGimpProject/Makefile)
}

SUBDIRS += photivoProject
SUBDIRS += ptCreateAdobeProfilesProject
SUBDIRS += ptCreateCurvesProject
SUBDIRS += ptGimpProject
SUBDIRS += ptClearProject

RETURN = $$system(touch ./photivoProject/install_prefix && rm ./photivoProject/install_prefix && echo $${PREFIX} >> ./photivoProject/install_prefix)

# Install
unix {
  QMAKE_STRIP = echo
  binaries.path = $${PREFIX}/bin
  binaries.files = photivo
  binaries.files += ptClear
  shortcut.path = $${PREFIX}/share/applications
  shortcut.files = ./ReferenceMaterial/photivo.desktop
  shortcut2.path = ~/.local/share/applications
  shortcut2.files = ./ReferenceMaterial/photivo.desktop
  icon.path = $${PREFIX}/share/pixmaps
  icon.files = ./photivo.png
  curves.path = $${PREFIX}/share/photivo/Curves
  curves.files = ./Curves/*
  mixer.path = $${PREFIX}/share/photivo/ChannelMixers
  mixer.files = ./ChannelMixers/*
  presets.path = $${PREFIX}/share/photivo/Presets
  presets.files = ./Presets/*
  profiles.path = $${PREFIX}/share/photivo/Profiles
  profiles.files = ./Profiles/*
  translations.path = $${PREFIX}/share/photivo/Translations
  translations.files = ./Translations/*
  lensfun.path = $${PREFIX}/share/photivo/LensfunDatabase
  lensfun.files = ./LensfunDatabase/*
  uisettings.path = $${PREFIX}/share/photivo/UISettings
  uisettings.files = ./UISettings/*
  images.path = $${PREFIX}/share/photivo/
  images.files = ./photivo.png
  images.files += ./photivoLogo.png
  images.files += ./photivoPreview.jpg
  INSTALLS += binaries
  INSTALLS += shortcut
  INSTALLS += shortcut2
  INSTALLS += icon
  INSTALLS += curves
  INSTALLS += mixer
  INSTALLS += presets
  INSTALLS += profiles
  INSTALLS += translations
  INSTALLS += lensfun
  INSTALLS += uisettings
  INSTALLS += images
}

###############################################################################
