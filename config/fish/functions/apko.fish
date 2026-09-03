# function apko --wraps apko --description 'apko'
#         docker run \
#             --privileged \
#             --rm \
#             -i \
#             -v "$HOME/.netrc":/root/.netrc \
#             -v /var/run/docker.sock:/var/run/docker.sock \
#             -v "$PWD":/work \
#             -w /work \
#             -e ARCH="$(uname -i)" \
#             apko:1.2.29 $argv
# end
