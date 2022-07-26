# Output diagnostic messages
#   You can print log messages, warnings, and fatal errors, which will
#   appear in the (Tiltfile) resource in the web UI. Tiltfiles support
#   multiline strings and common string operations such as formatting.
#
#   More info: https://docs.tilt.dev/api.html#api.warn
print("""
-----------------------------------------------------------------
✨ 목표는 tilt 를 occm에 적용하는 것!
-----------------------------------------------------------------
""".strip())
warn('ℹ️ Open {tiltfile_path} in your favorite editor to get started.'.format(
    tiltfile_path=config.main_path))

# 1. go build
# 2. docker build
# 3. push to container registry?
# 4. deploy new version of occm

reg = os.environ.get('REGISTRY', '')
if reg:
    default_registry(reg)

compile_cmd = 'CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o out/openstack-cloud-controller-manager-amd64 cmd/openstack-cloud-controller-manager/main.go'

local_resource(
    'occm-compile',
    compile_cmd,
    deps=['./cmd', './pkg'],
)

docker_build(
    'occm-image',
    '.',
    entrypoint=['/app/out/ike'],
    dockerfile='deployments/Dockerfile',
    only=[
        './out',
    ],
    live_update=[
        sync('./out', '/app/out'),
    ],
)

