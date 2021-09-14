###########################################################################
# Copyright 2015, 2016, 2017 IoT.bzh
#
# author: Iot-Team <frederic.marec@iot.bzh>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
###########################################################################


Name:    agl-helloworld-binding
Version: 1.0-67a0dbc-dirty
Release: 1
Group:   AGL
License: APL2.0
Summary: Provide an Helloworld Binding
Url:     https://github.com/redpesk-samples/helloworld-binding
Source0: %{name}_%{version}.orig.tar.gz

BuildRequires: cmake
BuildRequires: gcc gcc-c++


BuildRoot:     %{_tmppath}/%{name}-%{version}-build

%define _prefix /opt/RP/helloworld-binding
%define __cmake cmake

%description
Provide an Helloworld Binding

%prep
%setup -q

%build
%cmake -DCMAKE_INSTALL_PREFIX:PATH=%{_libdir}
make %{?_smp_mflags}

%install
CURDIR=$(pwd)
[ -d build ] && cd build
make populate
mkdir -p %{?buildroot}%{_prefix}
cp -r package/* %{?buildroot}%{_prefix}

cd $CURDIR
find %{?buildroot}%{_prefix} -type d -exec echo "%dir {}" \;>> pkg_file
find %{?buildroot}%{_prefix} -type f -exec echo "{}" \;>> pkg_file
sed -i 's@%{?buildroot}@@g' pkg_file


%files -f pkg_file
%defattr(-,root,root)
