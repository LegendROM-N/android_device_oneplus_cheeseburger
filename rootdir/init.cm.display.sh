#!/system/bin/sh
#
# Copyright (C) 2017 The MoKee Open Source Project
#               2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if [[ -f /data/misc/display/livedisplay_mode ]]; then
	cat /data/misc/display/livedisplay_mode > /sys/class/graphics/fb0/color_profile
fi
