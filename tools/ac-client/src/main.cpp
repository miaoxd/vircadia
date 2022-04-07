//
//  main.cpp
//  tools/ice-client/src
//
//  Created by Seth Alves on 2016-10-5
//  Copyright 2016 High Fidelity, Inc.
//
//  Distributed under the Apache License, Version 2.0.
//  See the accompanying file LICENSE or http://www.apache.org/licenses/LICENSE-2.0.html

#include <iostream>
#include <iomanip>
#include <string>
#include <vector>

#include <BuildInfo.h>

#include "ACClientApp.h"

using namespace std;

int main(int argc, char* argv[]) {
    setupHifiApplication(BuildInfo::AC_CLIENT_SERVER_NAME, BuildInfo::APPLICATION_INFO);

    Setting::init();

    ACClientApp app(argc, argv);
    return app.exec();
}
