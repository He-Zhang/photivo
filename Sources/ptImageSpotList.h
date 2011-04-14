/*******************************************************************************
**
** Photivo
**
** Copyright (C) 2011 Bernd Schoeler <brjohn@brother-john.net>
**
** This file is part of Photivo.
**
** Photivo is free software: you can redistribute it and/or modify
** it under the terms of the GNU General Public License version 3
** as published by the Free Software Foundation.
**
** Photivo is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU General Public License for more details.
**
** You should have received a copy of the GNU General Public License
** along with Photivo.  If not, see <http://www.gnu.org/licenses/>.
**
*******************************************************************************/

#ifndef PTIMAGESPOTLIST_H
#define PTIMAGESPOTMLIST_H

#include <QList>
#include "ptImageSpot.h"

class ptImageSpotList: public QList<ptImageSpot*> {
////////////////////////////////////////////////////////////////////////////////
//
// PUBLIC members
//
////////////////////////////////////////////////////////////////////////////////
public:
  ~ptImageSpotList();

  void clear();
  void removeAt(int i);
  void removeFirst();
  void removeLast();
  void replace(int i, ptImageSpot *const&t);
};

#endif
