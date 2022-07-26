# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# We not using scratch because we need to keep the basic image information
# from parent image
FROM golang:1.17-alpine
ARG ARCH=amd64

# Fill out the labels
LABEL name="openstack-cloud-controller-manager" \
      license="Apache Version 2.0" \
      maintainers="Kubernetes Authors" \
      description="OpenStack cloud controller manager" \
      architecture=$ARCH \
      distribution-scope="public" \
      summary="OpenStack cloud controller manager" \
      help="none"

#ADD rootfs.tar /
#ADD /out out
WORKDIR /
COPY out/openstack-cloud-controller-manager-amd64 .
CMD ["/openstack-cloud-controller-manager-amd64"]
