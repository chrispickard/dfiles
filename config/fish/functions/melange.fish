function melange --wraps melange --description 'melange'
        docker run \
            --privileged \
            --rm \
            -v "$HOME/.netrc":/root/.netrc \
            -u "1000:1000" \
            -v "$PWD":/work \
            -w /work \
            -e ARCH="$(uname -i)" \
            cgr.dev/chainguard/melange $argv

end
