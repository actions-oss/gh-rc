#!/usr/bin/env bash
#echo "It should build binaries in dist/<platform>-<arch>[.exe] as needed."

git clone https://github.com/ChristopherHX/runner.server "$PWD/runner.server"
mkdir -p "$PWD/dist"

dotnet msbuild $PWD/runner.server/src/dir.proj -t:GenerateConstant -p:RunnerVersion="${1#"v"}" -p:PackageRuntime='Any'

cat << EOF |
osx-x64 darwin-amd64
osx-arm64 darwin-arm64
linux-x64 linux-amd64
linux-arm linux-arm
linux-arm64 linux-arm64
win-x86 windows-386 .exe
win-x64 windows-amd64 .exe
win-arm64 windows-arm64 .exe
EOF
while read RID OUT EXT; do
    dotnet publish "$PWD/runner.server/src/Runner.Client" -p:PublishSingleFile=true -p:EnableCompressionInSingleFile=true -p:RuntimeIdentifier="$RID" -p:IncludeNativeLibrariesForSelfExtract=true -p:Version="${1#"v"}" --output "$PWD/out"
    cp "$PWD/out/Runner.Client$EXT" "$PWD/dist/$OUT$EXT"
done
